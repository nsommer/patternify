module Patternify
  class OrClause
    def initialize(&block)
      self.conditions = []
      self.or(&block)
    end
    
    def or(&block)
      conditions << Patternify::Pattern.new(&block)
      self
    end
    
    def to_s
      "(" + conditions.map(&:to_s).join("|") + ")"
    end
    
    private
    
    attr_accessor :conditions
  end
end