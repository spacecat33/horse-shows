class SessionsController << ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
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
        session.delete :username
        redirect_to login_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end