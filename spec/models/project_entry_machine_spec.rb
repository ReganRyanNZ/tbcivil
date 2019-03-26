# require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:user) { FactoryBot.create(:user, team: team) }
  let(:machine) { FactoryBot.create(:machine, team: team) }
  let(:project) { FactoryBot.create(:project, team: team) }
  let(:entry) { FactoryBot.create(:entry, user: user) }
  let(:project_entry) { FactoryBot.create(:project_entry, project: project, entry: entry) }
  let(:project_entry_machine) { FactoryBot.create(:project_entry_machine, project_entry: project_entry, machine: machine) }
  it "is valid with valid attributes" do
    expect(project_entry_machine).to be_valid
  end
end
