
class UserMailer < ApplicationMailer
  
   def personal_item_email()
     @user = params[:user]
     @url  = 'http://example.com/login'
     mail(to: @user.email, subject: 'Оформление приватного товара')
   end
 end