require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "associations" do
    it { should have_many(:room_messages).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
