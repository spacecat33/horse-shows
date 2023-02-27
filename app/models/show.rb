class Show < ApplicationRecord
    belongs_to :horse
    belongs_to :user

    # scope :cost_of_show, ->(n = 30) { where('entry_fee: ?', n) } #:cost_of_show is a class method and entry_fee: is a column in the database and '>50' is a sequel query. 
    # scope :class_discipline, ->(n = 'dressage') { where("disipline: '?' ) }
    
    scope :expensive_shows, -> { where('entry_fee > 30') }

    def self.first_five
       all.limit(5)
    end

end