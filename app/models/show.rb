class Show < ApplicationRecord
    belongs_to :horse
    belongs_to :user

    def attend_show
        @user = self.user
        @horse= self.horse

        if @user.level < self.level
            "Sorry. You are not good enough to compete in #{show.title}."
        elsif @horse.level < self.level
            "Sorry. Your horse is not good enough to compete in #{show.title}."
        else
           "#{@user} and #{@horse} have been entered into #{show.title} and have paid #{show.entry_Fee}. "
            return true
        end
    end
end