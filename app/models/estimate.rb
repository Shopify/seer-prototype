class MonotonicEstimateValidator < ActiveModel::Validator
  def validate(estimate)
    unless monotonic?(estimate.min_frequency, estimate.likely_frequency, estimate.max_frequency)
      estimate.errors.add :base, "Frequency values need to be monotonic (min <= likely <= max)"
    end
    unless monotonic?(estimate.min_magnitude, estimate.likely_magnitude, estimate.max_magnitude)
      estimate.errors.add :base, "Magnitude values need to be monotonic (min <= likely <= max)"
    end
  end

  private

  def monotonic?(min, likely, max)
    min <= likely && likely <= max
  end
end

class Estimate < ApplicationRecord
  belongs_to :expert
  belongs_to :project
  has_many :scenario_bin

  validates :min_magnitude, :likely_magnitude, :max_magnitude, :min_frequency, :likely_frequency, :max_frequency, presence: true
  validates :min_magnitude, numericality: { greater_than: 0, only_integer: true }
  validates :likely_magnitude, numericality: { greater_than: 0, only_integer: true }
  validates :max_magnitude, numericality: { greater_than: 0, only_integer: true }
  validates :min_frequency, numericality: { greater_than: 0 }
  validates :likely_frequency, numericality: { greater_than: 0 }
  validates :max_frequency, numericality: { greater_than: 0 }

  include ActiveModel::Validations
  validates_with MonotonicEstimateValidator
end
