require 'matrix'

module Languages
  class Epl2
    class Position < Vector

      def x
        self[0]
      end

      def y
        self[1]
      end
      
      def render
        ""
      end
    end
  end
end
