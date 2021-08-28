
#Intro 
# So far we've created instance methods and instance variables for our individual objects 
# We can also create class methods and class variables 
# Class variables are used to store values related to a class in general rather than a particular instance 
# Class methods are similarly used for implementing behavior that is realated to a class in general rather than an instance 

# In the next several lessons we'll be taking a look at:
# 
# How to recognize a class variable
# Utilizing class variables
# Knowing when to use attr_accessor vs creating the methods manually
# Use cases for defining private and protected methods
# The difference between public, private, and protected methods
# Using class variables to keep track of data pertaining to a class
# The concept of remembrance in object-oriented programming

#-------------------------------------------------------------------------------------------------
# Class Variables and Class Methods 
# Understand why and when to use class varaibles and methods 
# Understand the scope of class variables and class methods 

# All objects are bundles of data and behavior or attributes and methods 
# We understand this to be true of finstances of a class 
# Each instance contains attributes or properties to store data as well as methods that can enact behavior 

# For example, lets say we have a class, Album 
# Every individual album instance should have a release data attribute 
# To do this we define an instance variable @release_data 
# and an instance method #release_data that exposes or reveals that variable 
class Album
    # We have an instance variable, @release_date, which can be set equal to a value using the 
    # release_date=() method, a setter method 
    def release_date=(date)
        @release_date = date
    end 

    # Then we have a getter method release_date that returns the value of @release_date
    def release_date 
        @release_data
    end
end
# We can execute the following 
album = Album.new
album.release_date = 1991
album.release_date
# => 1991 

# What you might not know, is that the Album class itself is also an object 
# It fits our definition of an object as a bundle of code that contains attributes and behaviors 
# The Album class can have its own variables and methods called class variables and class methods 
#------------------------------------------------------------------------------------------------------

# Why Use Class Variables and Methods 
# Say you want to keep a counter for how many albums you had in your music collection 
# The current code for Album class has no way to keep such a count 

# We start by asking "whose responsibility is it to enact this behavior or functionality?"
# So far we have an Album class and have album instances 
# So, it is the responsibility of an individual album to keep count of all the other albums?
# No 
# It's the job of the Album class to keep count of all the instances it produces 

# So how do we enact that?
# With class variables and methods 
# The goal is to be able to ask Album class "How many albums have you produced?"
# asking so like, Album.count
#-------------------------------------------------------------------------------------------------

# Building Class Methods and Using Class Variables 
# Instance variables are responsible for holding info regarding an instance. 
#   it is a varaible that is available in SCOPE for all instance methods in the class 

# Class Variables are accessible to the entire class 
#   It has class SCOPE. 
#   A class method is a method that is called on the class itself and not on the isnstances of the class 

# Class variables are typically used to store information regarding the calss as a whole
# and class methods enact behavior that belong to the whole class, not just the individual instances of that class 
#----------------------------------------------------------------------------------------------------

# Defining a Class Variable 
# A class variable:  @@variable_name 
# you can set it equal to any data type 

# Create a class variable and set it to equal 0
class Album

  @@album_count = 0

  def release_date=(date)
    @release_date = date
  end

  def release_date
    @release_date
  end
end 

# Now how do we access it? We use a Class method
#--------------------------------------------------------------------------------------------

#Defining a Class Method 
# A class method is defined like this 
def self.class_method_name 
    # some code 
end 

# Above, self keyword refers to the ENTIRE classs itself, and not an instance of the class 
# In this case we are inside the class only, not inside an instance method of that class 
# So we are in the CLASS SCOPE. 

# Define a class method .count that returns the current count of albums 
class Album 
    @@album_count = 0 

    # class method (self here refers to the class Album)
    def self.count 
        @@album_count
    end 
end
puts Album.count
    #=> 0
#----------------------------------------------------------------------------------------------

# Operating on a Class Variable From an Instance Method 
# Currently, @@album_count is stuck at 0 
# When and how should we increment it?
# The count of albums should go up as soon as new album is created or initialized 
# We can hook into this moment in time in our #inititalize method 
class Album
  @@album_count = 0

  def initialize
    @@album_count += 1 
  end 

  def self.count 
    @@album_count
  end 
end
# Above we are using the @@album_count class variable inside our initialize method, which 
# is an instance method 
# we are staying, when a new album is created, access the @@album_count class and increment its value by 1

# We can access our class variables anywhere in our class: in both class and instance methods 
# Now our code should behave in the following manner 
Album.new
Album.new
Album.new
p Album.count
  # => 3 

# If we were to write a similar class definition in JS, it would look like 
#       class Album {
#           static albumCount = 0 
#       
#           constructor(){
#               Album.albumCount++;
#           }
#       
#           static count() {
#               return this.albumCount;
#           }
#       }
#       new Album();
#       new Album();
#       new Album();
#       Album.count();
#       // => 3 

#-----------------------------------------------------------------------------------------------

# Class Constants 
# Another type of variable that can be useful when building out classes is a class constant 
# Class constants have a lot in common with class variables 
# Both types or variables 
#   Are defined in the body of the class 
#   Can be accessed from within a class method 
#   Can be accessed from within an instance method 

# A class Constant looks a bit different than a class variable 
# It is defined using all capital letters 
class User 
    ROLES =  ["Admin", "Moderator", "Contributor"]
end 

# When deciding when to use a class constant or class variable, the key distinction is that 
# a class constants are used to STORE DATA that DOESN"T CHANGE(is constant)
# while a class variable is used to state data that does change 

# Example:
# We could define a list of valid genres for our album class using a class Constant 
class Album
  GENRES = ["Hip-Hop", "Pop", "Jazz"]

  @@album_count = 0

  def initialize(genre)
    if GENRES.include?(genre)
      @@album_count += 1
    end
  end

  def self.count
    @@album_count
  end
end 
# We can access class constants from outside of the class using this syntax 
p Album::GENRES 
#=> ["Hip-Hop", "Pop", "Jazz"] 