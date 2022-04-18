class Project < ApplicationRecord
  has_many :estimates

  validates :name, presence: true
end
