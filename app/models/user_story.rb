class UserStory < ApplicationRecord
  belongs_to :project
  validates :priority, numericality: { only_integer: true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10, message: " must be a number from 1 to 10"  }, :presence => true
end
