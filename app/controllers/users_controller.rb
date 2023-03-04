class UsersController < ApplicationController
   
    def index
        @user = current_user
    end

    def new
        redirect_to root_path if logged_in?
        @user = User.new
    end


    def create
        @user = User.create(user_params)

        if @user = User.authenticate(params[:username], params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new' # use this if change this code to show error with form and want to keep their existing entries
            # redirect_to '/signin'
        end
    end
    
    def edit
        @user = User.find_by(id: params[:id])
       
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @user = current_user  
    end
   
    private
    
    def user_params
        params.require(:user).permit(
            :name, 
            :email, 
            :provider,
            :uid,
            :image_url,
            :country,
            :level,
            :password, 
            :password_confirmation
        )
    end

end
