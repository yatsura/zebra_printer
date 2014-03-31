module Languages
  class Zpl2
    class Barcode
      def initialize(font, code_type, opts = {})
        @font = font

        @code = code(code_type)
        @human_readable = "Y"
      end

      def code(code_type)
        case(code_type)
        when :code_128
          "BC"
        end
      end
      
      def render(text)
        "^#{@code}#{@font.rotation},#{@font.height*2},#{@human_readable},N,N^FD#{text}^FS"
      end
    end
  end
end
