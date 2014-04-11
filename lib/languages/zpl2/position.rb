module Languages
  class Zpl2
    class Position
      attr_accessor :x, :y
      
      def self.[](x,y)
          new x,y
      end

      def self.from_array(ary)
        x, y = ary.pop(2)
        new x,y
      end
      
      def render
        "^FO#{x},#{y}"
      end

      def +(v)
        case v
        when Position
          self.class[x+v.x,y+v.y]
        end
      end

      def ==(v)
        (x==v.x) && (y==v.y)
      end
      
      def to_a
        [x,y]
      end
      private
      def initialize(x,y)
        @x, @y = x,y
      end
    end
  end
end
