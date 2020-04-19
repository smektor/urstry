class Project < ApplicationRecord
  belongs_to :user
  has_many :user_stories, dependent: :destroy
end
