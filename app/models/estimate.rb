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
  belongs_to :familiarity
  has_many :scenario_bin

  after_save :create_scenario_bins

  validates :min_magnitude, :likely_magnitude, :max_magnitude, :min_frequency, :likely_frequency, :max_frequency, :familiarity, presence: true
  validates :min_magnitude, numericality: { greater_than: 0, only_integer: true }
  validates :likely_magnitude, numericality: { greater_than: 0, only_integer: true }
  validates :max_magnitude, numericality: { greater_than: 0, only_integer: true }
  validates :min_frequency, numericality: { greater_than: 0 }
  validates :likely_frequency, numericality: { greater_than: 0 }
  validates :max_frequency, numericality: { greater_than: 0 }

  include ActiveModel::Validations
  validates_with MonotonicEstimateValidator

  attr_accessor :number_of_samples

  def scenario_max
    scenario_bin.maximum(:value)
  end

  def scenario_mode
    max_count = self.scenario_bin.maximum(:count)
    scenario_bin.where(count: max_count).pluck(:value)[0]
  end

  def scenario_min
    scenario_bin.minimum(:value)
  end

  private

  def create_scenario_bins
    # First, delete existing bins
    ScenarioBin.destroy_by(estimate: self)

    # Then, create the new bins
    magnitude_estimate = EstimatesHelper::ThreePointEstimate.new(
      min: self[:min_magnitude],
      likely: self[:likely_magnitude],
      max: self[:max_magnitude]
    )
    frequency_estimate = EstimatesHelper::ThreePointEstimate.new(
      min: self[:min_frequency],
      likely: self[:likely_frequency],
      max: self[:max_frequency]
    )

    sampled_scenarios = EstimatesHelper::Scenarios.new(magnitude_estimate:, frequency_estimate:).sample(number_of_samples: number_of_samples || 1_000_000)

    sampled_scenarios.each do |scenario|
      ScenarioBin.create(estimate: self, value: scenario[:value], count: scenario[:count])
    end
  end
end
