class SessionsController < ApplicationController
    


    def new
        redirect_to root_path if logged_in?
    end

    def create
        redirect_to root_path if logged_in?
        if auth
            @user =
                    User.find_or_create_by(email: auth['uid']) do |u|
                            u.name = auth['info']['name']
                            u.email = auth['info']['email']
                            u.image_url = auth['info']['image']
                            u.password = SecureRandom.hex(12)
                    end
                    session[:user_id] = @user.id
        
                    render '/application/home'
                end
      end

    def signin
        @users = User.all
    end

    def signedin 
        @user = User.find_by(name: params[:user][:name])
        if !@user
            redirect_to '/signin'
        else
            session[:user_id] = @user.id
            redirect_to root_path
        end
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