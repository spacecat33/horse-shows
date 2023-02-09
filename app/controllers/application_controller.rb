class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

   
    def home
        @user = current_user
    end
    # # def authenticated?
    # #     if !logged_in?
    # #         redirect_to '/login'
    # #     end
    # # end

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])
        end
        # (@current_user ||= User.find(session[:user_id])) if session[:user_id]
    end

    # # def require_login
    # #     return head(:forbidden) unless session.include? :user_id
    # # end
end
