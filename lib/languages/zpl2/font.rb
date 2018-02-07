module Languages
  class Zpl2
    class Font
      attr_reader :name, :rotation, :height, :width

      def initialize(opts = {})
        # defaults
        @name     = opts[:name] || "0"
        @rotation = opts.include?(:rotation) ? font_rotation(opts[:rotation]) : font_rotation(:by_0)
        @height   = opts[:height] || 15
        @width    = opts[:width] || 12
        @name, @height, @width = font_size(opts[:size]) if opts.include?(:size)
        @code = "^CF"
      end

      def font_args(opts={})
        @name = font_size(opts[:size]) if opts.include? :size
      end

      def font_size(val)
        val.is_a?(Array) ? val : name_size(val)
      end

      def font_rotation(amount)
      @rotation = case(amount)
                          when :by_90
                            "R"
                          when :by_180
                            "I"
                          when :by_270
                            "B"
                          else
                            "N"
                          end
      end
      def block!
        @is_block = true
      end

      def render
        "^A#{@name},#{@rotation},#{@height},#{@width}\n#{set_default}"
      end

      private
      def set_default
        if @is_block
          "^FW#{@rotation}^CF#{@name},#{@height},#{@width}\n"
        else
          ""
        end
      end
      def name_size(val)
        case val
        when :normal
          [self.name,25,25]
        when :small
          [self.name,20,20]
        when :large
          [self.name,40,40]
        when :x_large
          [self.name,60,60]
        else
          [self.name,25,25]
        end
      end
    end
  end
end
