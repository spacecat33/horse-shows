class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user = User.find_by(name: params[:user][:name])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/projects'
            end
        else
            flash.now[:errors] = "There was an error logging in. Please check your name and password."
            render 'sessions/new'
        end
    end

    # def create
    #     if params[:name] && !params[:name].empty?
    #         session[:name] = params[:name]
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
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end