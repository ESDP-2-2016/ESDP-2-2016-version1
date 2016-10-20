class UserMailer < ApplicationMailer
  default from: 'socialhubs2016@gmail.com'

  def welcome_email(user,id,org,author)
    @author=author
    @user = user
    # @admin = AdminUser.first
    @org = org
    @id = id
    @url  = 'http://localhost:3000/admin/organizations/' + @id.to_s + '/edit'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
  def notification(user,id,org)
    @user = user
    @org = org
    @id = id
    mail(to: @user.email,subject: 'organization confirmed')
  end
end
