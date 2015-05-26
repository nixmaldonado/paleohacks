class Dog

  def initialize(name, kind)
    @name = name
    @kind = kind
  end

  def say_your_name!
    puts "My name is #{@name}"
  end

  def say_your_kind!
    puts "I'm a #{@kind}"
  end

  def tell_me_all!
    say_your_name!
    say_your_kind!
  end

  def self.say_your_name!(name)
    puts "My name is #{name}"
  end

end


