require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:valid_attributes) { { name: 'Test Room' } }
  let(:invalid_attributes) { { name: '' } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all rooms as @rooms" do
      room = Room.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:rooms)).to eq([room])
    end
  end

  describe "GET #show" do
    it "assigns the requested room as @room" do
      room = Room.create! valid_attributes
      get :show, params: { id: room.to_param }, session: valid_session
      expect(assigns(:room)).to eq(room)
    end
  end

  describe "GET #new" do
    it "assigns a new room as @room" do
      get :new, params: {}, session: valid_session
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, params: { room: valid_attributes }, session: valid_session
        }.to change(Room, :count).by(1)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved room as @room" do
        post :create, params: { room: invalid_attributes }, session: valid_session
        expect(assigns(:room)).to be_a_new(Room)
      end
    end
  end
end
