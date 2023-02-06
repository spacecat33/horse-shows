class Horse < ApplicationRecord
    has_many :shows
    has_many :riders, through: :shows, source: :user

end