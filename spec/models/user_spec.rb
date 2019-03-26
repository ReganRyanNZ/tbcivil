require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:user) { FactoryBot.create(:user, team: team) }
  it "is valid with valid attributes" do
    expect(user).to be_valid
  end
end
