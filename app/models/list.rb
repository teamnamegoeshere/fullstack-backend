class List < ApplicationRecord
    # relationships
    belongs_to :user
    has_many :movie_lists, dependant: :destroy
end
