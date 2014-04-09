module Languages
  class Epl2
    class Font
      attr_reader :name, :rotation, :height, :width
      
      def initialize(opts = {})
        # defaults
        @name     = opts[:name] || "2"
        @rotation = opts.include?(:rotation) ? font_rotation(opts[:rotation]) : font_rotation(:by_0)
        @height   = opts[:height] || 1
        @width    = opts[:width] || 1
        @name, @height, @width = font_size(opts[:size]) if opts.include?(:size)
      end
      
      def font_size(val)
        case val
        when :normal
          [2,1,1]
        when :small
          [1,1,1]
        when :large
          [3,1,1]
        when :x_large
          [4,1,1]
        else
          [2,1,1]
        end
      end

      def font_rotation(amount)
      @rotation = case(amount)
                          when :by_90
                            1
                          when :by_180
                            2
                          when :by_270
                            3
                          else
                            0
                          end        
      end
      def render
        ""
      end

    end
  end
end
