class User < ApplicationRecord
    has_secure_password
    # lowercase username, unique, required letters and numbers only
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 } , format: { with: /\A[a-z0-9]+\z/ }
    # validate username for swearwords. In casual testing this hasn't been
    # very effective but better than nothing for now
    validate :text_must_be_decent
    # email needs to adhere to basic email format, be unique and is required
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 8 }, format: { with: /(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)/
    }
    # first name minimum 2 characters, required
    validates :first_name, presence: true, length: { minimum: 2 } 
    # last name minimum 2 characters, required
    validates :last_name, presence: true, length: { minimum: 2 } 
    # date of birth, required, between 1900 and today
    validates :date_of_birth, presence: { message: "must be a valid date" }
    validates_date :date_of_birth, between: [ '1900-01-01', lambda { Date.current }]

    # swearword helper method
    def text_must_be_decent
        require "swearjar"
        sj = Swearjar.default
        if sj.profane?(username)
            errors.add(:username, 'cannot contain obscenities')
        end
    end
    # relationships
    has_many :lists
    # issues with dependant: :destroy to address later
    # , dependent: :destroy
    has_many :watched_movies
    # issues with dependant: :destroy to address later
    # , dependant: :destroy
end
