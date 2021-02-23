class ComicsSerializer
  attr_accessor :results

  def initialize(results)
    @results = results
  end

  def serialize
    results.map do |result|
      Comic.new(result)
    end
  end
end
