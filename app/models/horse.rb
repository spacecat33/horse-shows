class Horse < ApplicationRecord
    has_many :shows
    has_many :users, through: :shows

    validates :name, presence: true
    # validates_format_of :name, :with => /^[A-Za-z\s]*$/, :message => "can only contain alphanumeric characters and spaces!"
    validates :name, uniqueness: {:case_sensitive => false, :message => "is already is use for another horse!"}

    def new_horse_entry(user, title, level, discipline)
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