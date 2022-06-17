class Metric < ApplicationRecord
  belongs_to :project

  enum kind: [ :product, :process, :project ]
end
