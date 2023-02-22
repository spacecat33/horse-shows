class Show < ApplicationRecord
    belongs_to :horse
    belongs_to :user

    scope :most_expensive_show, -> { where(entry_fee: '> 20') } #:most_expensive_show is a class method and entry_fee: is a column in the database and '>50' is a sequel query. 
   
    def self.first_five
        all.limit(5)
    end
end