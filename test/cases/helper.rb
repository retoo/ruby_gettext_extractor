$LOAD_PATH.unshift File.expand_path("../../lib", File.dirname(__FILE__))
require 'test/unit'

require 'rubygems'

#optional gems
begin
  require 'redgreen'
rescue LoadError
end
