# Private Methods 
# Define private methods
# Understand the context in which you will use such a method
# See how private methods are defined

# Background: Instance and Class Methods 
# We've been working with different types of methods 
# instances and class methods 
# instance methods are called on instances of a class 

class Bartender
  attr_accessor :name
  ## Class methods keep track of all of the new instance of Bartender 
  @@all = []

  def initialize(name)
    @name = name
    # shovel every new instance of Bartender into a class variable that holds all bartenders
    @@all << self
  end

  # class method self.all which we'll call on the class itself to return all of the bartenders
  def self.all 
    @@all
  end

  # intro is an instance method because we can call it on an instance of Bartender class
  def intro
    "Hello, my name is #{self.name}!"
  end
end

phil = Bartender.new("Phil")
phil.intro
#=> "Hello, my name is Phil!" 

nancy = Bartender.new("Nancy")
Bartender.all
#=> [#<Bartender:0x007f94cb16bbd0 @name="Phil">, #<Bartender:0x007f94cb16bb58 @name="Nancy">] 

#----------------------------------------------------------------------------------------

# Public vs. Private Methods 

# Defining a Public Method 
# We've already been writing public methods: intro and self.all 
# We can call them from outside the scope of the class declaration 
# like on the instance of the class or the class itself 
# Public methods are called by an explicit receiver: the instance of phil explicitly 
# receives the method intro 

# Defining Private Methods 
# Private methods cannot be called by an explicit receiver 
# Meaning we can only call private methods within the context of the defining class 
# the receiver of a private method is always self 

# Why use Private Methods?
# They are a way of encapsulating functionality within a class 
# For example: a bartender can make a drink at a customer's request 
# Part of the process of making the drink includes choosing liquors, mixers, garnish
# and stirring everything together 

# As a customer, you're permitted to ask the bartender for a drink (from a menu of options)
# but you can't instruct him or her on each step 

# The smaller steps that make up the bartender's job can be considered private methods 
# Private methods also signal to other developers that this method is depended on by other methods in your program 
# Signals that they should beware of removing such a method for fear of breaking other parts 

#------------------------------------------------------------------------------------------------
# Building a Private Method 
# We've already written a private method in our Bartender class #initialize 
# phil.initialize
# #=>NoMethodError: private method `initialize' called for #<Bartender:0x007fafb4257dd8 @name="Phil"> 