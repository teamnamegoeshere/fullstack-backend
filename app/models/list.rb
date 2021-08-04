class List < ApplicationRecord
    # relationships
    belongs_to :user
    has_many :movie_lists
    # issues with dependant: :destroy to address later
    # , dependant: :destroy
    # do I need to specify user is required?


end
