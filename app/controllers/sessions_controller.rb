class SessionsController < ApplicationController
    


    def new
        redirect_to root_path if logged_in?
    end

    def create
            if auth
            @user =
                    User.find_or_create_by(name: auth['info']['nickname']) do |u|
                            u.name = auth['info']['nickname']
                            # u.email = auth['info']['email']
                            u.image_url = auth['info']['image']
                            u.password = SecureRandom.hex(12)
                    end
                else
                    # authenticate_local_login(params)
                end
                    session[:user_id] = @user.id
                # byebug
                    redirect_to @user
                
      end

    def signin
        @user = current_user
        @users = User.all
    end

    def signedin 
        @user = User.find_by(name: params[:user][:name])
        # if !@user
        #     redirect_to '/signin'
        # else
        #     session[:user_id] = @user.id
        #     redirect_to root_path
        # end
        #or
        # if @user && @user.authenticate(params[:user][:password])
        #     session[:user_id] = @user.id
        #     redirect_to @user
        # else
        #     redirect_to '/signin'
        # end
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'

    end

    def signout
        session.delete(:user_id)
        redirect_to '/signin'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    def logout
        session.clear
    end

end