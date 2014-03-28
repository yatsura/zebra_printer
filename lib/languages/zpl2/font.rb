module Languages
  class Zpl2
    class Font
      def initialize(opts = {})
        # defaults
        @font_name     = opts[:name] || "B"
        @font_rotation = opts.include?(:rotation) ? font_rotation(opts[:rotation]) : font_rotation(:by_0)
        @char_height   = opts[:height] || 15
        @char_width    = opts[:width] || 12
        @font_name, @char_height, @char_width = font_size(opts[:size]) if opts.include?(:size)
      end

      def font_args(opts={})
        @font_name = font_size(opts[:size]) if opts.include? :size
      end

      def font_size(val)
        case val
        when :normal
          ["B",15,12]
        when :small
          ["A",15,12]
        when :large
          ["D",15,12]
        when :x_large
          ["E",15,12]
        else
          ["B",15,12]
        end
      end

      def font_rotation(amount)
      @font_rotation = case(amount)
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
      def render
        "^A#{@font_name}#{@font_rotation},#{@char_height},#{@char_width}\n"
      end
    end
  end
end
