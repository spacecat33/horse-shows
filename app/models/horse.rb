class Horse < ApplicationRecord
    include ActiveModel::Validations

    has_many :shows
    has_many :users, through: :shows

    validates(:name, { :length => { :minimum => 2 } })
    validates :name, presence: { :message =>  "must be given please" }
    validates :name, uniqueness: {:case_sensitive => false, :message => "is already is use for another horse!"}
    
    before_save :make_title_case

    private

    def make_title_case
        # Rails provides a String#titlecase method
        self.name = self.name.titlecase
    end

end