require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:cpf) }

    it { should validate_length_of(:password).is_at_least(6) }

    it { should validate_uniqueness_of(:email) }

    it { should validate_uniqueness_of(:cpf) }

    it { should allow_value("13467402402").for(:cpf) }
    it { should_not allow_value("1234567890", "123456789101").for(:cpf) }
  end
end
