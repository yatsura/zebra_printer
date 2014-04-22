module Languages
  class Epl2
    class Text
      attr_accessor :font, :text, :position
      
      def initialize(opts = {})
        # FIXME
        @font = opts[:font] || Epl2::Font.new
        @position = (opts[:at] || Languages::Epl2::Position[0,0])
        @text = ""
      end
      
      def render
        "A#{@position},#{@font.rotation},#{@font.name},#{@font.height},#{@font.width},N,\"#{@text}\""
      end

      def x=(x)
        @position.x = x
      end

      def y=(y)
        @position.y = y
      end
    end
  end
end
