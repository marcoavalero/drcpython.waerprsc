require 'rubygems'
require 'rparsec'

module WAEParser
  include RParsec
  extend RParsec::Parsers
  Id = regexp(/[a-z]/)
  Num = number.token(:number)
  Reserved = Keywords.case_sensitive(%w{with exit})
  Ops = Operators.new(%w{+ - \{ \} ;})
  Lexer = longer(Id.token(:id) , Reserved.lexer) | Num |  Ops.lexer
  Lexeme = Lexer.lexeme << eof
end
