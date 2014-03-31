module Languages
  class Zpl2
    class Font
      attr_reader :name, :rotation, :height, :width
      
      def initialize(opts = {})
        # defaults
        @name     = opts[:name] || "B"
        @rotation = opts.include?(:rotation) ? font_rotation(opts[:rotation]) : font_rotation(:by_0)
        @height   = opts[:height] || 15
        @width    = opts[:width] || 12
        @name, @height, @width = font_size(opts[:size]) if opts.include?(:size)
      end

      def font_args(opts={})
        @name = font_size(opts[:size]) if opts.include? :size
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
      def render
        "^A#{@name}#{@rotation},#{@height},#{@width}\n"
      end
    end
  end
end
