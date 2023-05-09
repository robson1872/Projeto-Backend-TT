class Question < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :formulary_id }
  validate :valid_formulary

  def valid_formulary
    errors.add(:formulary_id, 'this is not a valid formulary') unless Formulary.exists?(formulary_id)
  end

  acts_as_paranoid
  belongs_to :formulary
  has_many :answers
end
