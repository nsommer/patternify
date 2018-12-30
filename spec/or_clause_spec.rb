require "spec_helper"

RSpec.describe Patternify::OrClause do
  describe "#to_s" do
    subject do
      described_class.new do
        string "ruby"
      end.or do
        string "java"
      end.to_s
    end
    
    it 'should return the compiled pattern as a string' do
      expect(subject.to_s).to eq "(ruby|java)"
    end
  end
end
