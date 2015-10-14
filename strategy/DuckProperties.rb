module FlyBehaviour
  module NoFly
    def fly
      "No Fly"
    end
  end

  module WithWings
    def fly
      "Fly With Wings"
    end
  end

  module WithRocket
    def fly
      "Fly With Rocket"
    end
  end
end

module QuackBehaviour
  module Quack
    def quack
      "Quack Quack!"
    end
  end

  module Squeeze
    def quack
      "I am Squeezed!"
    end
  end

  module Silence
    def quack
      "Silence!"
    end
  end
end

