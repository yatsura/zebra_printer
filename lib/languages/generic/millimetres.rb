module Languages
  module Generic
    class Millimetres
      def initialize(int)
        @int = int
      end

      def to_i
        @int
      end

      def +(other)
        if other.is_a? Millimetres
          self.class.new(@int + other.to_i)
        elsif other.is_a? Integer
          self.class.new(@int + other)
        else
          if other.respond_to? :coerce
            a,b = other.coerce(self)
            a + b
          else
            raise TypeError, "#{other.class} can't be coerced into #{self.class.name}"
          end
        end
      end

      def -(other)
        if other.is_a? Millimetres
          self.class.new(@int - other.to_i)
        elsif other.is_a? Integer
          self.class.new(@int - other)
        else
          if other.respond_to? :coerce
            a,b = other.coerce(self)
            a - b
          else
            raise TypeError, "#{other.class} can't be coerced into #{self.class.name}"
          end
        end        
      end

      def ==(other)
        @int == other.to_i
      end

      def coerce(other)
        [Millimetres.new(other),self]
      end

      def to_dots(ratio = :dpi203)
        dpm = if ratio == :dpi203
                (203/25.4)
              else
                (300/25.4)
              end
        Languages::Generic::Dots.new((@int * dpm).round)
      end
    end
  end
end
