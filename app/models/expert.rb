class Expert < ApplicationRecord
  has_many :estimates

  validates :name, presence: true
end
