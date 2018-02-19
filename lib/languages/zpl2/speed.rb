module Languages
  class Zpl2
    class Speed
      def initialize(amount)
        set(amount)
      end

      def render
        "^PR#{@amount},D,A"
      end
      private
      def set(amount)
        @amount = case(amount)
        when :slow
          '1'
        when :normal
          'A'
        when :fast
          'C'
        end
      end
    end
  end
end
