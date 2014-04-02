module Languages
  class Zpl2
    class Position
      attr_reader :x, :y
      
      def initialize(x,y)
        @x, @y = x,y
      end

      def render
        "^FO#{@x},#{@y}"
      end
    end
  end
end
