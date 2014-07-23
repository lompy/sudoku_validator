class Combiner
  def initialize(collection: [], queries: [])
    unless collection.is_a?(Array) && queries.is_a?(Array)
      raise ArgumentError.new('Expected to get an array') unless collection.is_a? Array
    end
    define_queries!(queries, collection)
  end

  private 

  def define_queries!(queries, collection)
    queries.each do |q|
      define_singleton_method(q, query_lambda(q, collection))
    end
  end

  def query_lambda(query, collection)
    lambda do
      return false if collection.empty?
      collection.all? { |item| item.send(query) }
    end
  end
end
