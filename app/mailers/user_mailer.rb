class UserMailer < ApplicationMailer
    default from: 'fakeymcfake@faker.com'

    def welcome_email
      @user = params[:user]
      @url  = 'http://127.0.0.1:3000/'
      mail(to: @user.email, subject: 'Welcome to My Facebook Clone Project')
    end
end
