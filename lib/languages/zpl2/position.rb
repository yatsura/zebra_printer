module Languages
  class Zpl2
    class Position
      include Languages::Generic::Position
      
      def render
        "^FO#{x.to_dots},#{y.to_dots}"
      end
    end
  end
end
