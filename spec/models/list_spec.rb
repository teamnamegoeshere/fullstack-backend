require 'rails_helper'

RSpec.describe List, type: :model do
  subject {
    User.new(
      first_name: "Test",
      last_name: "User",
      email: "test@test.com",
      username: "test123",
      password: "Password1",
      password_confirmation: "Password1",
      date_of_birth: "2000-10-01"
    )

    List.new(
    user_id: 1,
    title: "List",
    description: "This is a list",
    public: false
    )
  }

  pending "title" do

    it "cannot be empty" do
      subject.title = nil
      expect(subject).to be_valid
    end

    
  end

  # letters and numbers in title?
  # title maximum - 50 characters?
  # title minimum 3 characters
  # no profanity in title
  # no profanity in description
  # user is required
  # title is required
  # description is required
  # description maximum
  # public defaults to false
end
