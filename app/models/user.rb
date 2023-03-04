class User < ApplicationRecord
    has_secure_password
    has_many :shows, dependent: :destroy # ‘dependent: :destroy’ ensures that, if a given user is destroyed, all joiner table rows with that user will be destroyed as well.
    has_many :horses, -> {distinct}, through: :shows
    
    validates(:name, { :length => { :minimum => 2 } })
    validates :name, uniqueness: true, presence: true  
    

    before_save :make_title_case

    def total_spend_on_fees
        # User#total_spend_on_fees
        self.shows.sum(:entry_fee)
    end

   

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end
    

end