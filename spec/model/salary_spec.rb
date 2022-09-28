require 'rails_helper'
describe Salary do
  describe '#employee_name' do
    it 'validates presence' do
    record = Salary.new
    record.employee_name = ''
    record.validate
    expect(record.errors[:employee_name]).to include("can't be blank")
    record.employee_name = 'garvit'
    record.validate
    expect(record.errors[:employee_name]).to_not include("can't be blank")
    end
  end
end

#callback Rspec

describe Salary, type: :model do
  let(:salary) { build(:salary) }

  describe '#salary_amount' do
    it 'before_save callback' do
      expect(salary).to receive(default_salary)
      salary.run_callbacks(:save)
    end
  end
end