class Break < ApplicationRecord
    belongs_to :user

    validates :reason, presence: true

    validates :day, presence: true

    after_create :break_send
    
    private

    def self.search_by(search_term)
        where("LOWER(reason) LIKE :search_term", search_term: "%#{search_term.downcase}")
    end


    def break_send 
        AdminMailer.break_send(self.to).deliver_now
    end
end
