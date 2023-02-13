class HorsesController < ApplicationController

    def index
        @horses = Horse.all
        @user = current_user
    end

    def show
        @horse = Horse.find_by(id: params[:id])
        @show = Show.new
        @user = current_user
    end

    def new
        @horse = Horse.new
    end

    def create
        @horse = Horse.create(horse_params)
        redirect_to @horse
    end

    def edit
        @horse = Horse.find_by(id: params[:id])
       
    end

    def update
        horse = Horse.find_by(id: params[:id])
        horse.update(horse_params)
        redirect_to horse_path(horse)
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