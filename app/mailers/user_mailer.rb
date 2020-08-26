
class UserMailer < ApplicationMailer
  
   def personal_item_email()
     @user = params[:user]
     @url  = 'http://example.com/login'
     mail(to: @user.email, subject: 'Оформление приватного товара')
   end

   def random_item_email()
    @email = params[:email]
    @key  = params[:key]
    mail(to: @email, subject: 'Random')
   end

   def personal_item_purchased()
    @trat = params[:trat]
    @user = params[:user]
    @key = params[:key]
    @url  = 'http://example.com/login'
    mail(to: @trat.email, subject: 'Оформление приватного товара')
  end

  def report_email()
    @user = params[:user]
    @suspect = params[:suspect]
    @report_id = params[:report_id]
    mail(to: @user.email, subject: 'Report')
  end

  def report_submitted_email()
    @ceo = params[:ceo]
    @suspect = params[:suspect]
    @user = params[:user]
    @report_id = params[:report_id]
    mail(to: @ceo.email, subject: 'Жалоба')
  end
 end