class List < ApplicationRecord
    # title is present and between 3 and 50 characters
    validates :title, presence: true, length: { in: 3..50 }
    # validate title for swearwords. Not particularly effective
    validate :title_must_be_decent
    # description is present and between 10 and 500 characters
    validates :description, presence: true, length: { in: 10..500 }
    # validate description for swearwords. Not particularly effective
    validate :description_must_be_decent
    
    # swearword helper methods. This isn't DRY but I've spent hours
    # trying to get it to work and I need to move on
    def title_must_be_decent
        require "swearjar"
        sj = Swearjar.default
        if sj.profane?(title)
            errors.add(:title, 'cannot contain obscenities')
        end
    end

    def description_must_be_decent
        require "swearjar"
        sj = Swearjar.default
        if sj.profane?(description)
            errors.add(:description, 'cannot contain obscenities')
        end
    end
    
    # relationships
    # comment out belong_to until Auth completed
    # belongs_to :user
    has_many :movie_lists
    # issues with dependant: :destroy to address later
    # , dependant: :destroy
    # do I need to specify user is required?

end
