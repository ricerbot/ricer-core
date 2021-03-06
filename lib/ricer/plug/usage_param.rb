module Ricer::Plug
  class UsageParam
    
    include Ricer::Base::Base
    
    def to_label; @parser.param_label; end

    def is_eater?; @eater||@parser.is_eater?; end
    
    def initialize(paramstring)
      @eater = !!paramstring.index('.')
      unless @eater
        @parser = Param.parser!(paramstring.trim!('<.>'))
      else
        @parser = Param.parser!('message')
      end
    end
    
    def parser
      @parser
    end
    
    def parse(input, message)
      @parser.convert_in!(input.gsub("\x00", ' '), message)
    end
    
    def print(message=nil)
      @parser.display(message)
    end
    
  end
end
