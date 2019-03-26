require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:team) { FactoryBot.create(:team) }
  let(:user) { FactoryBot.create(:user, team: team) }
  let(:entry) { FactoryBot.build(:entry, user: user) }

  it "is valid with valid attributes" do
    expect(entry).to be_valid
  end

  describe "#started_at_time" do
    it "returns the started_at datetime, only showing the hours and minutes" do
      expect(entry.started_at_time).to eq("08:30")
    end
  end

  describe "#finished_at_time" do
    it "returns the finished_at datetime, only showing the hours and minutes" do
      expect(entry.finished_at_time).to eq("17:30")
    end
  end
end
