module Languages
  class Zpl2
    class Text
      # TODO Escape seqs

      def initialize(string)
        @string = string
      end
      
      def render
        "^FD#{@string}^FS"
      end
    end
  end
end
