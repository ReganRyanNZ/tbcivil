require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:project) { FactoryBot.create(:project, team: team) }
  it "is valid with valid attributes" do
    expect(project).to be_valid
  end
end
