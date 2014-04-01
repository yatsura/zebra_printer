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
      def initialize(font, code_type, opts = {})
        @font = font
        #defaults
        @type,@nb_width,@wb_width,@height,@human_readable = BarcodeClasses[code_type]
      end

      def render(x,y,value)
        "B#{x},#{y},#{@font.rotation},#{@type},#{@nb_width},#{@wb_width},#{@height},#{@human_readable},\"#{value}\""
      end
    end
    
    class Barcode2D
      BarcodeClasses = {
                        data_matrix: ["D",16,16]
                       }
      def initialize(font, code_type, opts = {})
        @font = font
        @type,@columns_encode,@rows_encode = BarcodeClasses[code_type]
      end

      def render(x,y,value)
        "b#{x},#{y},#{@type},c#{@columns_encode},r#{@rows_encode},\"#{value}\""
      end
    end
  end
end
