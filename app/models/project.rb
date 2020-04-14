class Project < ApplicationRecord
  has_many :user_stories, dependent: :destroy
end
