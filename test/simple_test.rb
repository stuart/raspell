$:.unshift(File.dirname(__FILE__) + "/../lib/")

require 'test/unit'
require "raspell"

class TestSpell < Test::Unit::TestCase

  def setup
    @aspell = Aspell.new
    @text = ["Hiere is somthing wrong on the planett. And it was not the Apollo."]
  end
 
  def test_correct_lines
    assert_equal(["<wrong word> is <wrong word> wrong on the <wrong word>. And it was not the Apollo."],
                 @aspell.correct_lines(@text) { |word| "<wrong word>" }) 
  end

  def test_list_mispelled
    misspelled = @aspell.list_misspelled(@text).sort
    assert_equal(3, misspelled.length)
  end
  
  def test_suggest
    @aspell.suggest("spel").each do |word|
      assert(["spell", "spiel", "spelt", "spew", "Opel", "spec", "sped", "Shel"].include? word)
    end
  end

  def test_check
    assert_equal(false, @aspell.check("spel"))
    assert(@aspell.check("spell"))
  end
  
end


