require 'rails_helper'

RSpec.describe User, type: :model do
    
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
    }

    describe "username" do

    it "cannot be empty" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "cannot contain special characters" do
      subject.username="h3@"
      expect(subject).to_not be_valid
    end

    it "cannot contain spaces" do
      subject.username="test user"
      expect(subject).to_not be_valid
    end

    it "cannot contain uppercase characters" do
      subject.username="Test123"
      expect(subject).to_not be_valid
    end

    it "must be longer than 3 characters" do
      subject.username="te"
      expect(subject).to_not be_valid
    end

    it "is unique" do
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
      expect(subject).to_not be_valid
    end
  
  end

  describe "email" do

    it "cannot be empty" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "cannot contain spaces" do
      subject.email = "test user@test.com"
      expect(subject).to_not be_valid
    end
    
    it "must follow the structure ___@___.___" do
      subject.email = "test@test"
      expect(subject).to_not be_valid
      subject.email = "test.com"
      expect(subject).to_not be_valid
      subject.email = "test.test@test"
      expect(subject).to_not be_valid
      subject.email = "test@test.com"
      expect(subject).to be_valid
    end

    it "is unique" do
      new_user = User.new(
        first_name: "Test",
        last_name: "User",
        email: "test@test.com",
        username: "test1231",
        password: "Password1",
        password_confirmation: "Password1",
        date_of_birth: "2000-10-01"
      )
      new_user.save!
      expect(subject).to_not be_valid
    end

  end

  describe "password" do

    it "cannot be empty" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it "must be 8 characters or longer" do
      expect(subject).to be_valid

      subject.password = "he1Lo"
      subject.password_confirmation = "he1Lo"
      expect(subject).to_not be_valid
    end
    it "must contain at least one number" do
      expect(subject).to be_valid

      subject.password = "helLoworld"
      subject.password_confirmation = "helLoworld"
      expect(subject).to_not be_valid
    end
    it "must contain at least one letter" do
      expect(subject).to be_valid

      subject.password = "456789@1"
      subject.password_confirmation = "456789@1"
      expect(subject).to_not be_valid
    end
  end
  
  describe "first_name" do

    it "cannot be empty" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "last_name" do
    it "cannot be empty" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "date_of_birth" do

    it "cannot be empty" do
      subject.date_of_birth = nil
      expect(subject).to_not be_valid
    end

    it "must be a valid date" do
      subject.date_of_birth = "2021-02-31"
      expect(subject).to_not be_valid
      subject.date_of_birth = "01-01-2000"
      expect(subject).to be_valid
    end

    it "cannot be in the future" do
      subject.date_of_birth = "9999-12-31"
      expect(subject).to_not be_valid
    end
    it "cannot be before 1900" do
      subject.date_of_birth = "1850-05-03"
      expect(subject).to_not be_valid
    end

  end
  
end
