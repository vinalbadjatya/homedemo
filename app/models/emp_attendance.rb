class EmpAttendance < ApplicationRecord
  belongs_to :user

    validates :project_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

    validates :task_description, presence: true

    # before_create :check_status?

    after_create :welcome_send

    private

    # def check_status?
    #     # byebug
    #     if created_at.present?
    #         if status_date.to_date == created_at.to_date
    #             redirect_to user_emp_attendance_path(current_user.id)
    #         else
    #             puts " already updated your status"
    #         end
    #     end
    # end

    def self.search_by(search_term)
        where("LOWER(project_name) LIKE :search_term", search_term: "%#{search_term.downcase}")
    end

    def welcome_send 
        AdminMailer.welcome_send(self.mail_to).deliver_now
    end
end
