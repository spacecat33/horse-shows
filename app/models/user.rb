class User < ApplicationRecord
    has_secure_password
    has_many :shows
    has_many :horses, through: :shows


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