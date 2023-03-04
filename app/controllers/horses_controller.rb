class HorsesController < ApplicationController

    def index
        if @user = User.find_by_id(session[:user_id])
        @horses = @user.horses
        else
        redirect_to signin_path
        end

    end

    def show
        @horse = Horse.find_by(id: params[:id])
        @show = Show.new
        @user = current_user
    end

    def new
        @user = current_user
        @horse = Horse.new
    end

    def create
        @user = current_user
        @horse = Horse.new(horse_params)
        if @horse.save
            redirect_to horse_path(@horse)
        else
            # flash.now[:error] = "Could not save information"
            render :new
        end
    end

    def edit
        @user = current_user
        @horse = Horse.find_by(id: params[:id])
       
    end

    def update
        @user = current_user
        @horse = Horse.find_by(id: params[:id])
        if @horse.update(horse_params)
            redirect_to horse_path(@horse)
        else
            render :edit, status: :unprocessable_entity
        end
     end

      

     private

    def horse_params
        params.require(:horse).permit(
            :name,
            :level,
            :breed,
            :height,
            :colour,
            :age
        )
    end

end