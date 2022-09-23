class Break < ApplicationRecord
    belongs_to :user

    validates :reason, presence: { strict: true }

    validates :day, presence: { strict: true }
    

    def self.search_by(search_term)
        where("LOWER(reason) LIKE :search_term", search_term: "%#{search_term.downcase}")
    end
end
