module EstimatesHelper
  require 'simple-random'

  class ThreePointEstimate
    attr_reader :min, :likely, :max, :distributions

    def initialize(min:, max:, likely:)
      in_order = min <= likely && likely <= max
      raise ArgumentError.new('min, likely and max case estimates need to be monotonic (min <= likely <= max)') unless in_order

      @min = min
      @likely = likely
      @max = max
      @distributions = SimpleRandom.new
    end

    def sample
      distributions.triangular(min, likely, max)
    end
  end

  class Scenario
    def initialize(magnitude_estimate:, frequency_estimate:)
      @magnitude_estimate = magnitude_estimate
      @frequency_estimate = frequency_estimate
    end

    def sample
      sampled_scenarios = []

      20_000.times do
        magnitude = @magnitude_estimate.sample
        frequency = @frequency_estimate.sample
        risk = frequency * magnitude

        sampled_scenarios << { m: magnitude, f: frequency, r: risk }
      end

      sampled_scenarios
    end
  end
end
