require 'test/unit'
require 'waesec'

class WAEParserTest < Test::Unit::TestCase
  include WAEParser
  
  def test_id
    assert_equal 'c', Id.parse('c')
    assert_not_equal 'ca', Id.parse('ca')
  end

  def test_num
    assert_equal '1234', Num.parse('1234').text
    assert_equal 5432, Num.parse('5432').text.to_i
  end

  def test_keys
    assert_nothing_raised do Reserved.parser('with') end
    assert_nothing_raised do Reserved.parser('exit') end
    assert_raises(ArgumentError) do Reserved.parser('fred') end
  end

  def test_ops
    assert_not_nil Ops.lexer('+')
    assert_not_nil Ops.lexer('-') 
    assert_not_nil  Ops.lexer('}') 
    assert_not_nil  Ops.lexer('{') 
    assert_not_nil  Ops.lexer(';') 
    assert_nil Ops.lexer(':')
    assert_nil Ops.lexer('&')
  end

  def test_lexeme
    assert_nil Lexer.parse("with x e d{{x}\n")
    print Lexeme.parse("with xe d}{x")
  end
end
