require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:test_user) { create(:user) }

  before do
    sign_in(test_user)
  end

  describe 'GET /users' do
    it 'Renders a successful response' do
      get :index
      expect(response.status).to eql(200)
    end
  end

  describe 'GET /users/new' do
    it 'Renders a successful response' do
      get :new
      expect(response.status).to eql(200)
    end
  end

  describe 'POST users/create' do
    context 'with valid parameters' do
      before do
        @valid_params = { user: { email: Faker::Internet.email,
                                  password: Faker::Internet.password,
                                  role: 1 } }
        end

      it 'Creates a new user with teammate role' do
        expect do
          post :create, params: @valid_params
        end.to change(User, :count).by(1)
      end

      it 'Redirects to the root path' do
        post :create, params: @valid_params

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
