module Languages
  class Zpl2
    class MergeFont
      def initialize
        @font_opts = []
      end

      def add(opts)
        font = Zpl2::Font.new(merge(opts))
        @font_opts.push(opts)
        font
      end

      def remove
        @font_opts.pop
        Zpl2::Font.new(merge({}))
      end

      private
      def merge(opts)
        r = @font_opts.reduce({},:merge) || {}
        r.merge(opts)
      end
    end
  end
end
