module Languages
  class Epl2
    class BarcodeFactory
      def self.create_barcode(font, code_type, opts = {})
        if Barcode1D::BarcodeClasses.keys.include? code_type
          Barcode1D.new font,code_type,opts
        elsif Barcode2D::BarcodeClasses.keys.include? code_type
          Barcode2D.new font,code_type,opts
        else
          raise ArgumentException.new("Unknown barcode: #{code_type}")
        end
      end
    end
    class Barcode1D
      BarcodeClasses = {
                        code_128: ["1",2,2,50,"B"],
                        ean13: ["E30",2,2,50,"B"]
                       }
      def initialize(code_type, opts = {})
        @font = opts[:font] || Font.new
        #defaults
        @type,@nb_width,@wb_width,@height,@human_readable = BarcodeClasses[code_type]
        @x = (opts[:position] || [0,0])[0]
        @y = (opts[:position] || [0,0])[1]
        @text = opts[:text] || ""
      end

      def render
        "B#{@x},#{@y},#{@font.rotation},#{@type},#{@nb_width},#{@wb_width},#{@height},#{@human_readable},\"#{@text}\""
      end
    end
    
    class Barcode2D
      BarcodeClasses = {
                        data_matrix: ["D",16,16]
                       }
      def initialize(code_type, opts = {})
        @font = opts[:font] || Font.new
        @type,@columns_encode,@rows_encode = BarcodeClasses[code_type]
        @x = (opts[:position] || [0,0])[0]
        @y = (opts[:position] || [0,0])[1]
        @text = opts[:text] || ""        
      end

      def render
        "b#{@x},#{@y},#{@type},c#{@columns_encode},r#{@rows_encode},\"#{@text}\""
      end
    end
  end
end
