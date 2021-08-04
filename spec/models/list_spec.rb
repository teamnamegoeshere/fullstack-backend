require 'rails_helper'

RSpec.describe List, type: :model do

  User.create(
    first_name: "Test",
    last_name: "User",
    email: "test123@test.com",
    username: "test1234",
    password: "Password1",
    password_confirmation: "Password1",
    date_of_birth: "2000-10-01"
  )

  subject {
    List.new(
    user_id: 1,
    title: "Test List",
    description: "This is a test list with a maximum length of 500 characters.
    It can contain both Upper and Lower cases leters, numbers & special characters.",
    public: false
    )
  }

  describe "title" do

    it "is required" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "cannot contain special characters" do
      subject.title="h3@"
      expect(subject).to_not be_valid
    end
    
    it "is longer than 3 characters" do
      subject.title="te"
      expect(subject).to_not be_valid
    end

    it "is shorter than 50 characters" do
      subject.title="7DqWceX6DsAk7ybovDcRHLCbFz4SkioW15ZygX9NJeiTrC7Gt04Py1HKR1dE"
      expect(subject).to_not be_valid
    end

    it "cannot contain profanity" do
      subject.title="Shit Tier Movies"
      expect(title).to_not be_valid
    end

  end

  describe "description" do
    
    it "is required" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "is longer than 10 characters" do
      subject.description = "te"
      expect(subject.to_not be_valid)
    end

    it "is shorter than 500 characters" do
      subject.description = "ykRFtM1gOatsLOIzROjlX8NUV2xp8sAIGCOTODzkkdu5igJN5SPA
      gYT95twFgh3yAIVTyoCwWR0xnk4eb9egnbHpqGnC3pWiivz0mgnvhgQ5cqw7zfQ05g6E0MNsrAu
      bivpDw4BV4q1rBUfjCzK7i7B2AHO30qiBYmqOsi4dkNKdEYqk5Gq7T4vhdQw3ZXTnnFsEOzT63D
      Pu9gOtqJtnB1LyFi2QlmhWyhAJmoaOSKK8PjH1Qu52oncd187ZLwbYA9uox88WKMOhotsqEJ4MaR
      ldo8gAcoXVKmj1ZgTpxOo9GZ7IXEN8uJIfxtKI4pYF4zJB5c9cCCQ5eDFNTkaNp8ECb9kzWSnXIf
      yawCoE888XohRsSreR80Osth0mdzlpLzpmDhWBr2xGeTskPAEHFzsf3qZ49XeWQ6wONh46DYeVHdc
      0HKs5eeoKgRUUdyZWWETEmYTUjlwXzHw7PzMukGDFsPrz2hWoGRXy3kEJI4tJeg4oA1kN2"
      expect(subject).to_not be_valid
    end

    it "does not contain profanity" do
      subject.description = "This is a list of shit tier movies"
      expect(subject).to_not be_valid
    end

  end

  describe "public" do
  
    it "is required" do
      subject.public = nil
      expect(subject).to_not be_valid
    end

    it "defaults to false" do
      subject.public = ""
      expect(subject).to equal(false)
    end

  end
    # public defaults to false
  # public is required
end
