class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user = User.find_by(username: params[:user][:username])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/projects'
            end
        else
            flash.now[:errors] = "There was an error logging in. Please check your username and password."
            render 'sessions/new'
        end
    end

    # def create
    #     if params[:username] && !params[:username].empty?
    #         session[:username] = params[:username]
    #         redirect_to root_path
    #     else
    #         redirect_to login_path
    #     end
    # end

    def destroy
        logout
        redirect_to root_path
      end
  

    private

    def logout
        session.clear
    end


    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end