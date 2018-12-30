require "spec_helper"

RSpec.describe Patternify::Pattern do
  describe "#to_s" do
    subject do
      described_class.new do
        negate do
          string "a"
        end
      end.to_s
    end
    
    it 'should return the pattern as a string' do
      expect(subject).to eq "[^a]"
    end
  end
  
  describe "#to_regexp" do
    subject do
      described_class.new do
        negate do
          string "a"
        end
      end.to_regexp
    end
    
    it 'should return a Regexp instance' do
      expect(subject.class).to eq Regexp
    end
    
    it 'should return a regexp instance with the described pattern as its source' do
      expect(subject.source).to eq "[^a]"
    end
  end
end