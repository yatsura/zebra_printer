module Languages
  class Epl2
    class Barcode
      def initialize(font, code_type, opts = {})
        @font = font
        #defaults
        @type,@nb_width,@wb_width,@height,@human_readable = code(code_type)
      end

      def code(value)
        @type = case value
                when :code_128
                  ["1",2,2,50,"B"]
                when :ean13
                  ["E30",2,2,50,"B"]
                end
      end
      def render(x,y,value)
        "B#{x},#{y},#{@font.rotation},#{@type},#{@nb_width},#{@wb_width},#{@height},#{@human_readable},\"#{value}\""
      end
    end
  end
end
