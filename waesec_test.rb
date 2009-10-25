require 'test/unit'
require 'waesec'

class WAEParserTest < Test::Unit::TestCase
  include WAEParser
  def test_id
    assert_equal 'c', Id.parse('c')
    assert_not_equal 'ca', Id.parse('ca')
  end

  def test_num
    assert_equal 1234, Num.parse('1234')
    assert_equal 5432, Num.parse('5432')
  end

  def test_keys
    assert_nothing_raised do Reserved.parser('with') end
    assert_nothing_raised do Reserved.parser('exit') end
    assert_raises(ArgumentError) do Reserved.parser('fred') end
  end
end
