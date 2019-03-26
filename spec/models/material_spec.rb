require 'rails_helper'

RSpec.describe Material, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:material) { FactoryBot.build(:material, team: team) }
  it "is valid with valid attributes" do
    expect(material).to be_valid
  end
end
