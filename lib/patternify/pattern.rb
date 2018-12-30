module Patternify
  class Pattern
    def initialize(&block)
      self.sub_patterns = []
      self.instance_eval &block
    end
    
    def to_regexp
      Regexp.new(to_s)
    end
    
    def to_s
      sub_patterns.map(&:to_s).reduce(&:+)
    end
    
    private
    
    attr_accessor :sub_patterns
    
    def string(s)
      sub_patterns << s
    end
    
    def none_or_one(&block)
      sub_patterns << "["
      self.instance_eval(&block)
      sub_patterns << "]?"
    end
    
    def one_or_many(&block)
      sub_patterns << "["
      self.instance_eval(&block)
      sub_patterns << "]+"
    end
    
    def none_or_many(&block)
      sub_patterns << "["
      self.instance_eval(&block)
      sub_patterns << "]*"
    end
    
    def negate(&block)
      sub_patterns << "[^"
      self.instance_eval(&block)
      sub_patterns << "]"
    end
    
    def any_char
      sub_patterns << "."
    end
  end
end
