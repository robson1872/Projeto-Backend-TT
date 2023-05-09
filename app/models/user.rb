class User < ApplicationRecord
    validates :name, :email, :cpf, :password, presence: true
    validates :email, :cpf, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }
    validates :cpf, cpf: true
    acts_as_paranoid
    has_many :visits
end
