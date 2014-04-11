require 'matrix'

module Languages
  class Zpl2
    class Position < Vector
      def x
        self[0]
      end

      def y
        self[1]
      end
      def render
        "^FO#{x},#{y}"
      end
    end
  end
end
