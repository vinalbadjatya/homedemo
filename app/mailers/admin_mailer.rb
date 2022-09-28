class AdminMailer < ApplicationMailer
    #default from: 'me@example.com'
    def welcome_send(email)
      @email = email
      mail to: @email, subject: "attendace Remainder", from: 'saloni@gmail.com'
    end

    def break_send(email)
      @email = email
      mail to: @email, subject: "attendace Remainder", from: 'saloni@gmail.com'
    end
end
