require 'rails_helper'

RSpec.describe "Lists", type: :request do
  describe "create new list" do
    it '/create' do
      # new_user = User.create(
      #   first_name: "Test",
      #   last_name: "User",
      #   email: "test1@test.com",
      #   username: "test123",
      #   password: "Password1",
      #   password_confirmation: "Password1",
      #   date_of_birth: "2000-10-01"
      # )

      list_params = {
        user_id: 1,
        title: "Test List",
        description: "This is a test list with a maximum length of 500 characters.
        It can contain both Upper and Lower cases leters, numbers & special characters.",
        public: false
      }
      post '/lists/create_list', :params => list_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
    end
  end
end
