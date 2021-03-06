module Languages
  class Epl2
    class Text
      attr_accessor :font, :text, :position
      
      def initialize(opts = {})
        # FIXME
        @position = Languages::Epl2::Position[0,0]
        @font = opts[:font] || Epl2::Font.new
        @position = Languages::Epl2::Position.from_array(opts[:at]) if opts.has_key?(:at)
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
