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
          ["2",3,3]
        when :small
          ["2",2,2]
        when :large
          ["2",4,4]
        when :x_large
          ["2",6,6]
        else
          ["2",3,3]
        end
      end

      def font_rotation(amount)
      @rotation = case(amount)
                          when :by_90
                            "1"
                          when :by_180
                            "2"
                          when :by_270
                            "3"
                          else
                            "0"
                          end        
      end
      def render
        ""
      end

    end
  end
end
