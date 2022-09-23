class Salary < ApplicationRecord
    belongs_to :user

    validates :salary_amount, length: { in: 4..6 },if: :check_salary?

    private

    def check_salary?
        if salary_amount >= 0
            self.salary_amount = salary_amount
        end
    end 


    def self.search_by(search_term)
        where("salary_amount LIKE :search_term  LOWER(employee_name) LIKE :search_term", search_term: "%#{search_term.downcase}")
    end

end
