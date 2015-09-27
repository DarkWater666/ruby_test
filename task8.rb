class Class
  def attr_accessor_with_history(attr)
    attr = attr.to_s
    attr_reader attr, attr + '_history'
    class_eval %{
      def #{attr}=(val)
        @#{attr} = val
        @#{attr}_history = [nil] if @#{attr}_history.nil?
        @#{attr}_history << val
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end
