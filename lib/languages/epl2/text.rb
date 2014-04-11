module Languages
  class Epl2
    class Text
      attr_accessor :font, :x, :y, :text
      
      def initialize(opts = {})
        # FIXME
        @font = opts[:font] || Epl2::Font.new
        @x, @y = (opts[:at] || [0,0]).pop(2)
        @text = ""
      end
      
      def render
        "A#{@x},#{@y},#{@font.rotation},#{@font.name},#{@font.height},#{@font.width},N,\"#{@text}\""
      end
    end
  end
end
