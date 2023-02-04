class WelcomeController < ApplicationController
    def hello
        redirect_to new_session_path unless current_user
        @user = User.find_by_id(session[:user_id])
      end
end