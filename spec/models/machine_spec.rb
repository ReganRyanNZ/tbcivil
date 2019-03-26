require 'rails_helper'

RSpec.describe Machine, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:machine) { FactoryBot.build(:machine, team: team) }
  it "is valid with valid attributes" do
    expect(machine).to be_valid
  end
end
