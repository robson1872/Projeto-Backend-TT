class Answer < ApplicationRecord
  validate :valid_question

  def valid_question
    errors.add(:question_id, 'this is not a valid question ') unless Question.exists?(question_id)
  end

  acts_as_paranoid
  belongs_to :question
end
