module Languages
  class Epl2
    class Document
      def initialize
        @document = document_start.concat "\n"
      end
      
      def <<(obj)
        string = obj.is_a?(String) ? obj : obj.render
        string.concat "\n" unless string.end_with? "\n"
        @document.concat string
      end

      def render
        @document.concat(document_end).concat("\n")
      end

      def document_start
        "N\n"
      end

      def document_end
        "P1\n"
      end
    end
  end
end
