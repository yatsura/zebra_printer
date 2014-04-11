module Languages
  module Generic
    module Position
      def self.included(base)
        base.extend ClassMethods
      end
      
      module ClassMethods
        def [](x,y)
          new x,y
        end

        def from_array(ary)
          x, y = ary.pop(2)
          new x,y
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
