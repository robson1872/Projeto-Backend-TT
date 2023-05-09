class Formulary < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    acts_as_paranoid
    has_many :questions
    has_many :answers, through: :questions
end
