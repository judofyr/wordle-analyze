require 'bundler/setup'
require 'minitest/autorun'

require_relative 'analyze'

class TestWordle < Minitest::Spec
  describe "score" do
    it do
      assert_equal [:green, nil, nil], Wordle.score("abc", "ade")
    end

    it do
      assert_equal [:green, :yellow, nil], Wordle.score("abc", "acd")
    end

    it do 
      assert_equal [:green, :green, nil], Wordle.score("acc", "acd")
    end

    it do 
      assert_equal [:yellow, :yellow, nil], Wordle.score("cac", "aca")
    end

    # 203

    it do
      assert_equal [:yellow, :yellow, nil, nil, nil], Wordle.score("crank", "rates")
    end

    it do
      assert_equal [nil, :green, :green, :green, nil], Wordle.score("crank", "grand")
    end

    it do
      assert_equal [nil, :green, :green, :green, :green], Wordle.score("crank", "prank")
    end

    it do
      assert_equal [nil, :green, :green, :green, :green], Wordle.score("crank", "frank")
    end

    it do
      assert_equal [:green, :green, :green, :green, :green], Wordle.score("crank", "crank")
    end
  end
end