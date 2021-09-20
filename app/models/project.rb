class Project < ApplicationRecord
  has_many :comments
	belongs_to :user
	validates :title, presence: true
end
