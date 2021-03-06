require 'rails_helper'
require 'httparty'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/ffapi.v1" }

  describe "GET #SHOW" do
    before (:each) do
      @user = FactoryBot.create :user
      get :show, params: {id: @user.id, format: :json}
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200}
  end
end
