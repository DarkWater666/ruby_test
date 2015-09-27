class Numeric
  @@default_curr = 'rouble'
  @@in_roubles   = { @@default_curr => 1.0, 'dollar' => 67.95, 'euro' => 75.65 }

  @@in_roubles.keys.each do |curr|
    curr = curr.to_s.gsub(/s$/, '')
    define_method(curr) do
      @@current_curr = curr
      self * @@in_roubles[@@current_curr]
    end
    alias_method curr + 's', curr
  end

  def in(arg)
    curr = arg.to_s.gsub(/s$/, '')
    @@in_roubles.key?(curr) ? exchange(curr) : close
  end

  private

  def exchange(curr)
    if @current_curr == curr || @@current_curr == @@default_curr || curr != @@default_curr
      (self / @@in_roubles[curr]).round 2
    else
      self * @@in_roubles[curr]
    end
  end

  def close
    fail NoMethodError, 'Выберите другую валюту.'
  end
end
