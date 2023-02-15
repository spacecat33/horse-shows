class User < ApplicationRecord
    has_secure_password
    has_many :shows
    has_many :horses, through: :shows

    validates :name, uniqueness: true, presence: true  

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end

end