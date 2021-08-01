class User < ApplicationRecord
    has_secure_password
    # lowercase username, unique, required letters and numbers only
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 } , format: { with: /\A[a-z0-9]+\z/ }
    # email needs to adhere to basic email format, be unique and is required
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 8 }, format: { with: /(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)/
    }
    # first name minimum 2 characters, required
    validates :first_name, presence: true, length: { minimum: 2 } 
    # last name minimum 2 characters, required
    validates :last_name, presence: true, length: { minimum: 2 } 
    # date of birth, required
    validates :date_of_birth, presence: { message: "must be a valid date" }
end
