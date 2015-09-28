class Numeric
  @@default_curr = 'rouble'
  @@in_roubles   = { @@default_curr => 1.0, 'dollar' => 67.95, 'euro' => 75.65 } # currency exchange values on 27.09.2015

  @@in_roubles.keys.each do |curr|
    curr = curr.to_s.gsub(/s$/, '')
    define_method(curr) do
      @@current_curr = curr
      return self
    end
    alias_method curr + 's', curr
  end

  def in(arg)
    curr = arg.to_s.gsub(/s$/, '')
    @@in_roubles.key?(curr) ? exchange(self, curr) : close
  end

  private

  def exchange(num, curr)
    ( num * ( @@in_roubles[@@current_curr] / @@in_roubles[curr] )).round 2
  end

  def close
    fail NoMethodError, 'Выберите другую валюту.'
  end
end
