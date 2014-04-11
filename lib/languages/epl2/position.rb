module Languages
  class Epl2
    class Position
      attr_reader :x, :y
      def initialize(x,y)
        @x = x
        @y = y
      end
    end

    def render
      ""
    end
  end
end
