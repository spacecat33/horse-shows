class UsersController < ApplicationController
    
    def create
        if !User.new(user_params).valid?
            redirect_to new_user_path
        else
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to root_path
        end
    end
    
    def new
        @user = User.new
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def total_spend_on_fees
        # User#total_spend_on_fees
        self.shows.sum(:entry_fees)
    end

    def total_spend_by_discipline(discipline)
        # User#total_spend_by_discipline(discipline)
        self.shows.where(discipline: disipline).sum(:entry_fee)
    end

    def self.number_one
        # User.number_one
        # returns one user/rider instance for the user/rider who has the highest total entry fee spend
        entry_fee_spend_by_user = Show(:user.id).sum(:entry_fee)
        user_id_with_highest_spend = entry_fee_spend_bu_user.max.first
        User.find(user_id_with_highest_spend)
    end
end
