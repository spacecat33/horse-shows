class ShowsController < ApplicationController

    # def summary
    #     "#{title} is a level #{level} #{discipline} event."
    # end
    
    def index
        # if user_id/horse_id in params then shows should 
        # be user or horse/shows otherwise all the shows
        # /users/:user_id/shows
        # @horse = Horse.find_by(id: params[:id])
        @user = current_user
        if params[:user_id] 
           @shows = @user.shows
        # elsif params[:horse_id]
        #     @shows = @horse.shows
        else
            @shows = Show.all 
        end
    end

    def create
        @show = Show.new(show_params)
        if @show.attend_show == true
            @show.save
            notice = "Thanks for attending the #{@show.title}!"
            redirect_to user_path(@show.user), notice: notice
        else
            notice = @show.attend_show
            redirect_to user_path(@show.user), notice: notice
        end
    end

    private

    def show_params
        params.require(:show).permit(
            :user_id,
            :horse_id
        )
    end
end