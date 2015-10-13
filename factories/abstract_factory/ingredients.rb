module Ingredients
  module Clams

    class Fresh
      def to_s
        "fresh clams"
      end
    end

    class Frozen
      def to_s
        "frozen clams"
      end
    end

  end

  module Sauce

    class Marinara
      def to_s
        "marinara sauce"
      end
    end

    class PlumTomato
      def to_s
        "plum tomato sauce"
      end
    end

  end

  module Cheese

    class Mozzarella
      def to_s
        "mozzarella cheese"
      end
    end

    class Reggiano
      def to_s
        "reggiano cheese"
      end
    end

  end

  module Dough

    class ThickCrust
      def to_s
        "thick crust dough"
      end
    end

    class ThinCrust
      def to_s
        "thin crust dough"
      end
    end

  end

  module Pepperoni

    class Sliced
      def to_s
        "sliced pepperoni"
      end
    end

  end
end
