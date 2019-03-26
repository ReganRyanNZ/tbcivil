require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { FactoryBot.create(:team) }
  it "is valid with valid attributes" do
    expect(team).to be_valid
  end
end
