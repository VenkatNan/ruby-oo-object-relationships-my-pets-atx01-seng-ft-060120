class Owner
attr_reader :name, :species

 @@all =[]

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |mine|
      mine.owner == self
    end
  end
  def dogs
    Dog.all.select do |myne|
      myne.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name,self)
  end
  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.dogs.map do |feel|
      feel.mood = "happy"
    end
  end
  def feed_cats
    self.cats.map do |food|
      food.mood = "happy"
    end
  end

  def sell_pets
    self.cats.map do |sell|
      sell.mood = "nervous"
      sell.owner= nil
    end
    self.dogs.map do |bye|
      bye.mood = "nervous"
      bye.owner= nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
