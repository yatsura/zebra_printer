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
        @code = "^CF"
      end

      def font_args(opts={})
        @name = font_size(opts[:size]) if opts.include? :size
      end

      def font_size(val)
        case val
        when :normal
          ["0",25,25]
        when :small
          ["0",20,20]
        when :large
          ["0",40,40]
        when :x_large
          ["0",60,60]
        else
          ["0",25,25]
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
        "^CF#{@name}#{@rotation},#{@height},#{@width}\n"
      end
    end
  end
end
