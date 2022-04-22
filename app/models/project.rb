class Project < ApplicationRecord
  has_many :estimates

  validates :name, presence: true

  def min_of_min_magnitudes
    self.estimates.minimum(:min_magnitude)
  end

  def average_of_likely_magnitudes
    estimate_average = self.estimates.average(:likely_magnitude)
    if estimate_average
      estimate_average.round(2)
    else
      nil
    end
  end

  def max_of_max_magnitudes
    self.estimates.maximum(:max_magnitude)
  end

  def min_of_min_frequencies
    self.estimates.minimum(:min_frequency)
  end

  def average_of_likely_frequencies
    estimate_average = self.estimates.average(:likely_frequency)
    if estimate_average
      estimate_average.round(2)
    else
      nil
    end
  end

  def max_of_max_frequencies
    self.estimates.maximum(:max_frequency)
  end

  def risk_possibilities
    estimates = self.estimates.map { |est| {scenario_max: est.scenario_max, scenario_min: est.scenario_min} }
    operations = {}

    estimates.each do |estimate|
      operations[estimate[:scenario_max]] ||= []
      operations[estimate[:scenario_max]] << -1

      operations[estimate[:scenario_min]] ||= []
      operations[estimate[:scenario_min]] << 1
    end

    magnitude_to_count = { 0 => 0 }
    count = 0
    operations.keys.sort.each do |key|
      count = count + operations[key].sum
      magnitude_to_count[key] = count
    end

    possibilites = []
    magnitude_to_count.each do |risk, count|
      possibilites << { risk:, count: }
    end

    possibilites
  end

  def modal_risk_densities
    raw_values = self.estimates.map { |est| est.scenario_mode }
    raw_values.map {|risk| { risk: } }
  end
end
