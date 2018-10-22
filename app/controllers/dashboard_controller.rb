class DashboardController < ApplicationController
  def index
    if current_user.blank?
      redirect_to new_user_session_path
    else
    end
  end
end
