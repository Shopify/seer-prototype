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

  def magnitude_possibilities
    estimates = self.estimates.select(:max_magnitude, :min_magnitude).order(:min_magnitude)
    operations = {}

    estimates.each do |estimate|
      operations[estimate.max_magnitude] ||= []
      operations[estimate.max_magnitude] << -1

      operations[estimate.min_magnitude] ||= []
      operations[estimate.min_magnitude] << 1
    end

    magnitude_to_count = { 0 => 0 }
    count = 0
    operations.keys.sort.each do |key|
      count = count + operations[key].sum
      magnitude_to_count[key] = count
    end

    possibilites = []
    magnitude_to_count.each do |magnitude, count|
      possibilites << { magnitude:, count: }
    end

    possibilites
  end
end
