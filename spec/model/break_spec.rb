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
    
    it "is valid with a reason and day" do
      user = User.new
      record = Break.new(reason: "Reason", day: 1, user_id: )
      expect(record).to be_valid
    end
  end
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
#   callback rspec
    # data {Break.new mail: "abc@gmail.com"}
    # data = Break.new
    # context "after create" do
    #   it "send a mail " do
    #     data.mail = "nil"
    #     data.save
    #     expect(data.errors[:mail]).to include("sorry")
    #   end
    #   it "send a mail " do
    #     data.mail = "abc@gmail.com"
    #     data.save
    #     expect(data.errors[:mail]).to_not include("sorry")
    #   end
    # end
end
