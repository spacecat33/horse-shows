class Horse < ApplicationRecord
    include ActiveModel::Validations

    has_many :shows, dependent: :destroy # ‘dependent: :destroy’ ensures that, if a given horse is destroyed, all joiner table rows with that horse will be destroyed as well.
    has_many :horses, -> {distinct}, through: :shows
    has_many :users, through: :shows

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, presence: { :message =>  "must be given please" }
    validates :name, uniqueness: {:case_sensitive => false, :message => "is already is use for another horse!"}
    # consider adding validation that checks horse associated with a show before saving.

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