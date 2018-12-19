class Link < ApplicationRecord
  belongs_to :user, optional: true # Prevents Invalid Record errors. -BW

  has_many :votes
end
