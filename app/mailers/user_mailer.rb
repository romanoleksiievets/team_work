class UserMailer < ApplicationMailer

  def news_created
    @news = current_user.news
    mail to: current_user.email
  end

end
