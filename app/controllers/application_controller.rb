class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_team!
    redirect_to new_team_path(user: current_user) unless current_user.team_id
  end
end
