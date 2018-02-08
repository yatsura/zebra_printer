module Languages
  class Zpl2
    class BarcodeFactory
      def self.create_barcode(code_type, opts = {})
        if Barcode1D::BarcodeClasses.keys.include? code_type
          Barcode1D.new code_type,opts
        elsif Barcode2D::BarcodeClasses.keys.include? code_type
          Barcode2D.new code_type,opts
        else
          raise ArgumentException.new("Unknown barcode: #{code_type}")
        end
      end
    end

    class Barcode1D
      BarcodeClasses = {
                        code_128: "BC",
                        ean13: "BE"
                       }
      def initialize(code_type, opts = {})
        @code = BarcodeClasses[code_type]
        @font = opts[:font] || Font.new
        @human_readable = opts[:human_readable] || "Y"
        @text = opts[:text] || ""
        @height = opts[:height] || @font.height*2
      end

      def render
        "^#{@code}#{@font.rotation},#{@height},#{@human_readable},N,N^FD#{@text}^FS"
      end
    end

    class Barcode2D
      BarcodeClasses = {
                        data_matrix: ["X",4,16,16]
                       }

      def initialize(code_type, opts = {})
        @font = opts[:font] || Font.new
        @code, @symbol_height, @columns_encode, @rows_encode = BarcodeClasses[code_type]
        @text = opts[:text] || ""
      end

      def render
        "^B#{@code}#{@font.rotation},#{@symbol_height},200,#{@columns_encode},#{@rows_encode}^FD#{@text}^FS"
      end
    end
  end
end
