class HorsesController < ApplicationController

    def new_hore_entry(user, title, level, discipline)
        # Horse#new_horse_entry(user, title, level, discipline)
        Show.create(
            title: title,
            level: level,
            disipline: discipline,
            entry_fee: entry_fee,
            horse_id: horse.id,
            user_id: user.id
        )
    end

end