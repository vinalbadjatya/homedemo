class Salary < ApplicationRecord
  belongs_to :user

  validates :employee_name, presence: true

  before_save :default_salary

  private

  def default_salary
    if salary_amount.nil?
      # byebug
      self.salary_amount = 45000
    end
  end
      
  def self.search_by(search_term)
    where("salary_amount LIKE :search_term  LOWER(employee_name) LIKE :search_term", search_term: "%#{search_term.downcase}")
  end
end
