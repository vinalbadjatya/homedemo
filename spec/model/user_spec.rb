require 'rails_helper'
describe User do 
    describe '#email' do 
        it 'validates presence ' do 
            record = User.new
            record.email = " "
            record.validate
            expect(record.errors[:email]).to include("can't be blank")
            record.email = "abc@gmail.com"
            record.validate
            expect(record.errors[:email]).to_not include("can't be blank")
        end
    end 

    it 'validates presence ' do 
        record = User.new
        record.user_mobileno = 
        record.validate
        expect(record.errors[:user_mobileno]).to include("can't be blank")
        record.user_mobileno = 12
        record.validate
        expect(record.errors[:user_mobileno]).to_not include("can't be blank")
    end
    it 'validates presence ' do 
        record = User.new
        record.date_of_birth = "12/02/2022"
        record.validate
        expect(record.errors[:date_of_birth]).to_not include("can't be blank")
    end

    it 'check user_name validation ' do 
        record = User.new
        record.user_name = "Vinal"
        record.validate
        expect(record.errors[:user_name]).to_not include("must start with upper case")
    end

    it 'check skills ' do 
        record = User.new
        record.skills = "python"
        record.validate
        expect(record.errors[:skills]).to_not include("can't be blank")
    end
end

