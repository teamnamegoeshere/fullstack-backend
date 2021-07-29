class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    # email validation currently causing errors, commenting out for now.
    # validates_length_of :email, with: URI::MailTo::EMAIL_REGEXP
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
end
