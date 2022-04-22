class Project < ApplicationRecord
  has_many :estimates

  validates :name, presence: true

  def min_of_min_magnitudes
    self.estimates.minimum(:min_magnitude)
  end

  def average_of_likely_magnitudes
    self.estimates.average(:likely_magnitude)
  end

  def max_of_max_magnitudes
    self.estimates.maximum(:max_magnitude)
  end

  def min_of_min_frequencies
    self.estimates.minimum(:min_frequency)
  end

  def average_of_likely_frequencies
    self.estimates.average(:likely_frequency)
  end

  def max_of_max_frequencies
    self.estimates.maximum(:max_frequency)
  end

  def estimate_risk_summaries
    estimates.map do |estimate|
      { expert_id: estimate.expert.id, minimum_risk: estimate.scenario_min, modal_risk: estimate.scenario_mode, maximum_risk: estimate.scenario_max }
    end
  end
end
