module Languages
  module Generic
    module Position
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        def [](x,y)
          o = new
          o.x,o.y = x,y
          o
        end

        def from_array(ary)
          x, y = ary.pop(2)
          x = Languages::Generic::Dots.new(x) if x.is_a? Integer
          y = Languages::Generic::Dots.new(y) if y.is_a? Integer          
          o = new
          o.x,o.y = x,y
          o
        end
      end

      attr_accessor :x, :y


      def +(v)
        case v
        when Position
          self.class[x+v.x,y+v.y]
        end
      end

      def ==(v)
        (x==v.x) && (y==v.y)
      end

      def x=(x)
        if x.is_a? Integer
          @x = Languages::Generic::Dots.new(x) if x.is_a? Integer
        else
          @x = x
        end
      end

      def y=(y)
        if y.is_a? Integer
          @y = Languages::Generic::Dots.new(y) if y.is_a? Integer
        else
          @y = y
        end
      end
      
      def to_a
        [x,y]
      end

      def to_s
        "#{x.to_dots},#{y.to_dots}"
      end
    end
  end
end
