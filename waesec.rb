require 'rubygems'
require 'rparsec'

module WAEParser
  include RParsec
  extend RParsec::Parsers
  Id = regexp(/[a-z]/)
  Num = integer.map{|x| x.to_i}
  Reserved = Keywords.case_sensitive(%w{ with exit })
end
