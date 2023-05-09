require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe "validations" do
    let(:visit) { Visit.new }

    it { should validate_presence_of(:data) }


    it { should validate_presence_of(:status) }
    it { should allow_value("PENDENTE", "REALIZANDO", "REALIZADA").for(:status) }
    it { should_not allow_value("INVALIDO").for(:status) }

    it { should belong_to(:user) }

    it { should validate_presence_of(:checkin_at) }

    it { should validate_presence_of(:checkout_at) }
  end
end
