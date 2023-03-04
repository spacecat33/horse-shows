class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
   

    # include ActionController::Live

    # def stream
    #   response.headers['Content-Type'] = 'text/event-stream'
    #   100.times {
    #     response.stream.write "hello world\n"
    #     sleep 1
    #   }
    # ensure
    #   response.stream.close
    # end

    def home
        @user = current_user
        if @user

        else
            redirect_to '/signin'
        end

    end

    def logged_in?
        !!current_user
    end

    def current_user
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])
        end
        @user ||= User.find_by_id(session[:user_id]) if session[:user_id]   #this would help to avoid duplicate requests to the database
    end

    #   def current_user
    #     @user ||= User.find_by_id(session[:user_id])
    #   end
    
    
    #   def logged_in?
    #     !current_user.nil?
    #   end
    
    #   def authorized
    #     redirect_to '/' unless logged_in?
    #   end

end
