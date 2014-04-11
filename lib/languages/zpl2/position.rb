module Languages
  class Zpl2
    class Position
      include Languages::Generic::Position
      
      def render
        "^FO#{x},#{y}"
      end
    end
  end
end
