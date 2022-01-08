require 'json'
require 'pp'

class Wordle
  if d = __dir__
    WORDS_FILE = d + "/words.json"
  else
    raise "Unable to locate word list"
  end

  def self.score(answer, guess)
    # @type var result: Array[reply]
    # @type var available: Array[String]
    result = Array.new(answer.size)

    available = []

    # Place greens
    answer.chars.each_with_index do |c, i|
      if guess[i] == c
        result[i] = :green
      else
        # Make them available for yellow placement
        available << c
      end
    end

    # Place yellows
    guess.chars.each_with_index do |c, i|
      if !result[i]
        if available.delete(c)
          result[i] = :yellow
        end
      end
    end

    result
  end

  def self.words
    @words ||= JSON.parse(File.read(WORDS_FILE))
  end

  def self.run
    # @type var worst: Array[Array[String, Integer, Array[reply]]]
    worst = []

    n = words.size

    words.each_with_index do |guess, idx|
      puts "Analyzing #{idx+1} of #{n}"

      replies = Hash.new(0)
      words.each do |answer|
        replies[score(answer, guess)] += 1
      end
      score, max_possible = replies.max_by { |_, v| v }
      worst << [guess, max_possible, score]
    end

    puts "Summary:"
    worst.sort_by! { |_, v| v }
    worst[0,15]&.each do |word, comb|
      puts "  #{word} (worst case leads to #{comb} possible answers)"
    end
  end
end

Wordle.run if $0 == __FILE__