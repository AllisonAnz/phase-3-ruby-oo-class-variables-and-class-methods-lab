# Remembering Objects 

# Use class Variables to store instances of a class 

# Say we're building a command line game in which players play various rounds until a final tally 
# determines the winner 

# Or creating an app in which we want to store a list of all the users who sing up 
# Or building a program that helps track and store passwords for various accounts 

# In all these ways our application needs a way to store or remember a collection of class instances 
# Wheter they are instances of a Game, User, or Password class 
# All of these examples would require our program to keep track of instances that are created 
# Ruby allows us to do so by using class variables to store new instances as soon as they are created 

#-------------------------------------------------------------------------------------------------
# Using Class Variables to Store instances of a Class 
# Imagine building an app that manages a user's music 
# Our app keeps track of all of the songs a user enters and allow our user to browse their existing songs 
class Song 
    attr_accessor :name 
    
    def initialize(name)
        @name = name 
    end 
end 

# We can create a new song 
hotline_bling = Song.new("Hotline Bling") 
thriller = Song.new("Thriller") 

# Currently our Song class has no way to keep track of the songs we just created and display them back to the user 

#-----------------------------------------------------------------------------------------------------
# Creating the Class Variable 
# Create a class variable @@all to store every instance of the Song class 
class Song

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end 

# How does it sotre these instance?
#------------------------------------------------------------------------------------------------------
# Adding instances to the @@all Array 
# The Song class should store instanced of itself on instantiation (when a new song gets created)
class Songs

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end
end 

# In initialize we use the self keyword to refer to the new object that has just been created by #new 
# when #new is called it creates a new instance of the class and then called #initialize on that new instance 
# initialize is technically an instance method 
# Inside the instance method we are in what is called METHOD SCOPE and self will refer to 
# whichever instance the method is being called one 
# We push self into the array that is stored in @@all 
# The @@all class variable will point to a growing array containing every instance of the Song class 

#-----------------------------------------------------------------------------------------------------
# Build a Class Method to Access A Class Variable 
# Let's call our class method .all 
# All it needs to do is return @@all variable 
# Remember that the last line of any method in Ruby is automatically RETURNED 
# So simply putting @@all in self.all is that method's purpose 
class Song

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end 
ninety_nine_problems = Song.new("99 Problems")
thriller = Song.new("Thriller") 
p Song.all
#=> # => [#<Song:0x00007fd9910c45a0 @name="99 Problems">, #<Song:0x00007fd9900dba58 @name="Thriller">] 
puts ""
#-------------------------------------------------------------------------------------------------------
# Building off of .all 
# With this method defined, we can now build more functionality in our class that involves that 
# collection of all songs, instead of just focusing on the song instances 
# For example:
# We could make a .print_all_songs_name class method which prings out all the names of the 
# Songs that the class knows about 
class Song

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # Class method prints out all the names of the Son'gs that the class knows about
  def self.print_all_song_names
    self.all.each do |song|
      puts song.name
    end
  end
end 

ninety_nine_problems = Song.new("99 Problems")
thriller = Song.new("Thriller") 
p Song.all
#=> #=> # => [#<Song:0x00007fd9910c45a0 @name="99 Problems">, #<Song:0x00007fd9900dba58 @name="Thriller">] 
Song.print_all_song_names
#=> 99 Problems
#=> Thriller