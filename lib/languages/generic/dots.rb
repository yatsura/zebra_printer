module Languages
  module Generic
    class Dots
      def initialize(int)
        @int = int
      end

      def to_i
        @int
      end

      def +(other)
        self.class.new(@int + value_of(other))
      end

      def -(other)
        self.class.new(@int - value_of(other))
      end

      def ==(other)
        @int == value_of(other)
      end

      def to_dots
        self
      end

      def to_s
        @int.to_s
      end
      private
      def value_of(other)
        v = other.respond_to?(:to_dots) ? other.to_dots.to_i : other.to_i
      end
    end
  end
end
