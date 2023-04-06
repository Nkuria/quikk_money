require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/api/v1/users', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Api::V1::User. As you add validations to Api::V1::User, be sure to
  # adjust the attributes here as well.

  let(:created_user) { create(:user) }
  let(:builded_user) { build(:user) }
  let(:valid_attributes) do
    {
      email: builded_user.email,
      first_name: builded_user.first_name,
      middle_name: builded_user.middle_name,
      phone: builded_user.phone,
      surname: builded_user.surname,
      password: builded_user.password
    }
  end

  let(:invalid_attributes) do
    {
      email: builded_user.email,
      first_name: builded_user.first_name,
      middle_name: builded_user.middle_name,
      phone: nil,
      surname: nil,
      password: builded_user.password
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::UsersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {Authorization: "Bearer #{authenticate(created_user)}"}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_user_url(created_user), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Api::V1::User' do
        expect do
          post api_v1_users_url,
               params: { user: valid_attributes }, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new api_v1_user' do
        post api_v1_users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Api::V1::User' do
        expect do
          post api_v1_users_url,
               params: { user: invalid_attributes }, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new api_v1_user' do
        post api_v1_users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested api_v1_user' do
        patch api_v1_user_url(created_user),
              params: { user: valid_attributes }, headers: valid_headers, as: :json
        created_user.reload
        expect(created_user.first_name). to eq(valid_attributes[:first_name])
      end

      it 'renders a JSON response with the api_v1_user' do
        patch api_v1_user_url(created_user),
              params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the api_v1_user' do
        patch api_v1_user_url(created_user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested api_v1_user' do
  #     user = User.create! valid_attributes
  #     expect do
  #       delete api_v1_user_url(user), headers: valid_headers, as: :json
  #     end.to change(User, :count).by(-1)
  #   end
  # end

  describe 'User login' do
    it 'user should login with valid credentials' do
      post '/api/v1/user/login', params: { user: { phone: created_user.phone, password: created_user.password } }
      expect(response).to have_http_status(:ok)
    end
    it 'User should not login with valid credentials' do
      post '/api/v1/user/login', params: {user: {phone: created_user.phone, password: '12345678'}}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
