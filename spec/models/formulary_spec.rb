require 'rails_helper'

RSpec.describe Formulary, type: :model do
  subject(:formulary) { Formulary.new }

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
