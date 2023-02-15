class HorsesController < ApplicationController

    def index
        @user = current_user
        @horses = Horse.all
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
        @horse = Horse.new(horse_params)
        if @horse.save
        redirect_to horse_path(@horse)
        else
            render :new
        end
    end

    def edit
        @horse = Horse.find_by(id: params[:id])
       
    end

    def update
        @user = current_user
        @horse = Horse.find_by(id: params[:id])
        if @horse.update(horse_params)
            redirect_to horse_path(@horse)
          else
            render :edit
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