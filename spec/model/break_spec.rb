require 'rails_helper'
describe Break do
  describe '#validation' do
    it "is not valid without a reason" do
      record = Break.new(reason: nil)
      expect(record).to_not be_valid
    end

    it "is not valid without a day" do
      record = Break.new(day: nil)
      expect(record).to_not be_valid
    end
    
    it 'with reason' do
      record = Break.new
      record.reason = "nothing"
      record.validate
      expect(record.errors[:reason]).to_not include("can't be blank")
    end
  end
end

describe Break do
  it { is_expected.to callback(:break_send).after(:create) }
end
