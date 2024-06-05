require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:room).inverse_of(:room_messages) }
  end

  describe "validations" do
    it { should validate_presence_of(:message) }
  end
end
