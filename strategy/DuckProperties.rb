module DuckProperties
  def display
    puts "Hi, I am a type of #{self.class}"
  end

  def swim
    puts "#{self.class} is swimming!"
  end

  module FlyBehaviour
    class NoFly
      def initialize
        puts "Can't fly"
      end
    end

    class WithWings
      def initialize
        puts "I got wings"
      end
    end

    class WithRocket
      def initialize
        puts "Yipee, I am on a rocket"
      end
    end
  end

  module QuackBehaviour
    class Quack
      def initialize
        puts "Quack Quack!"
      end
    end

    class Squeze
      def initialize
        puts "I am Squeezed!"
      end
    end

    class Silence
      def initialize
        puts "< silence >"
      end
    end
  end

end