class User < ApplicationRecord
    has_secure_password
    has_many :shows
    has_many :horses, through: :shows

end