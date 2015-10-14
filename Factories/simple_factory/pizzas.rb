module Pizzas
  class VeggiePizza < Pizza

    def prepare
      puts "Add veggies"
    end

    def bake
      puts "Bake veggie"
    end

    def cut
      puts "Cut veggie"
    end

  end
  class CheesePizza < Pizza

    def prepare
      puts "Add cheese"
    end

    def bake
      puts "Bake cheese"
    end

    def cut
      puts "Cut into squares"
    end

  end
end
