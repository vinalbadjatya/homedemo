class Project < ApplicationRecord
    belongs_to :user

    validates :project_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

    # validates :team_size, length: { in: 5..20 }

    validates :lead_name, presence: { strict: true }

    def self.search_by(search_term)
        where("LOWER(project_name) LIKE :search_term", search_term: "%#{search_term.downcase}")
    end

end
