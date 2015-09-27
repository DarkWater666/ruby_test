class CartesianProduct
  def initialize(a, b)
    @values = a.product(b) unless b.empty?
  end

  def each(&_block)
    return '' if @values.nil?
    @values.each { |v| yield v }
  end
end
