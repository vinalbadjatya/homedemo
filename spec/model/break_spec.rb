require 'rails_helper'
describe Break do
    describe '#reason' do
    it 'validates presence' do
      record = Break.new
      record.reason = '' 
      record.validate 
      expect(record.errors[:reason]).to include("can't be blank")  
      record.reason = 'personal'
      record.validate 
      expect(record.errors[:reason]).to_not include("can't be blank") 
    end
end
end
describe Break do
    describe "#day" do
        it 'validates presence' do
        record = Break.new
        record.day = 
        record.validate
        expect(record.errors[:day]).to include("can't be blank")
        record.reason = 2
        record.validate
        expect(record.errors[:day]).to_not include("can't be blank")
    end
end
end