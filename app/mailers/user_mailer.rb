
class UserMailer < ApplicationMailer
  
   def personal_item_email()
     @user = params[:user]
     @url  = 'http://example.com/login'
     mail(to: @user.email, subject: 'Оформление приватного товара')
   end

   def personal_item_purchased()
    @trat = params[:trat]
    @user = params[:user]
    @key = params[:key]
    @url  = 'http://example.com/login'
    mail(to: @trat.email, subject: 'Оформление приватного товара')
  end
 end