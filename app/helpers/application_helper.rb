module ApplicationHelper
  def login_and_logout
    if user_signed_in?
      render 'layouts/logout_button'
    else
      render 'layouts/login_button'
    end
  end
end
