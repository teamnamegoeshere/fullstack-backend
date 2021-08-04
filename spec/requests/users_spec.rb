require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "sign up new user" do
    it 'successfully create new user' do
      user_params = {
      first_name: "Test",
      last_name: "User",
      email: "test@test.com",
      username: "test123",
      password: "Password1",
      password_confirmation: "Password1",
      date_of_birth: "2000-10-01"
      }
      post '/auth/sign_up', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
    end
  end
  describe "log in user" do
    it "successfully log in user" do
      new_user = User.new(
        first_name: "Test",
        last_name: "User",
        email: "test1@test.com",
        username: "test123",
        password: "Password1",
        password_confirmation: "Password1",
        date_of_birth: "2000-10-01"
      )
      new_user.save!
      user_params = {
        username: "test123",
        password: "Password1"
      }
      post '/auth/log_in', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
    it "incorrect username or password" do
      new_user = User.new(
        first_name: "Test",
        last_name: "User",
        email: "test1@test.com",
        username: "test123",
        password: "Password1",
        password_confirmation: "Password1",
        date_of_birth: "2000-10-01"
      )
      new_user.save!
      user_params = {
        username: "test1234",
        password: "Password2"
      }
      
      post '/auth/log_in', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(404)
      
      user_params = {
        username: "test21",
        password: "Password1"
      }
      
      post '/auth/log_in', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(404)
      
    end
    it "missing username or password" do
      new_user = User.new(
        first_name: "Test",
        last_name: "User",
        email: "test1@test.com",
        username: "test123",
        password: "Password1",
        password_confirmation: "Password1",
        date_of_birth: "2000-10-01"
      )
      new_user.save!
      
      user_params = {
        username: "",
        password: "Password2"
      }
      post '/auth/log_in', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(404)
      
      user_params = {
        username: "test123",
        password: ""
      }
      post '/auth/log_in', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(404)

      user_params = {
        username: "",
        password: ""
      }
      post '/auth/log_in', :params => user_params.to_json, :headers => { "Content-Type": "application/json" }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(404)

    end
  end

end
