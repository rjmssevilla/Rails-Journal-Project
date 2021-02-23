class Category < ApplicationRecord
  validates :title, presence:true
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
