class Salary < ApplicationRecord
    belongs_to :user

    validates :employee_name, presence: true

    private
    
    def self.search_by(search_term)
        where("salary_amount LIKE :search_term  LOWER(employee_name) LIKE :search_term", search_term: "%#{search_term.downcase}")
    end

end
