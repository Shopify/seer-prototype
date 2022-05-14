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
    require 'histogram/array'

    def initialize(magnitude_estimate:, frequency_estimate:)
      @magnitude_estimate = magnitude_estimate
      @frequency_estimate = frequency_estimate
    end

    def sample(number_of_samples:)
      sampled_scenarios = []

      number_of_samples.times do
        magnitude = @magnitude_estimate.sample
        frequency = @frequency_estimate.sample

        sampled_scenarios << frequency * magnitude
      end

      histogram_scenarios = sampled_scenarios.histogram(100)

      scenario_results = []
      # left array is values, right array is counts
      histogram_scenarios[0].zip(histogram_scenarios[1]) do |pair|
        scenario_results << { value: pair[0], count: pair[1] }
      end

      scenario_results
    end
  end
end
