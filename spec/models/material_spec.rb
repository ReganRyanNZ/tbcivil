require 'rails_helper'

RSpec.describe Material, type: :model do
  let(:material) { FactoryBot.build(:material) }
  it "is valid with valid attributes" do
    expect(material).to be_valid
  end
end
