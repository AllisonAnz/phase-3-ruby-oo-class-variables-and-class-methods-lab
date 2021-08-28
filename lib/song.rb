# Use class variables to keep track of data pertaining to a class
# Define class methods to expose data pertaining to a class

# Song class can produce individual sonts 
# Each song as a name, artist and genre 
# The Song class need to keep track of the number of songs that it creates 
# Song.count #=> 30 

# Song class need to be able to show us all the artists of existing songs 
# Song.artists # => ["Jay-Z", "Drake", "Beyonce"] 

# Song class needs to be able to show us all the genres of existing songs 
# Song.genres # => ["Rap", "Pop"] 

# Song Class needs to able to keep track of the number of songs of each genre it creates 
# Song.genre_count 
# => {"rap" => 5, "rock" => 1, "country" => 3} 

# Song class needs to reveal the number of songs each artist is responsible for 
# Song.artist_count 
# => {"Beyonce" => 17, "Jay-Z" => 40} 

# Define a Song class that an individual song is initialized with a name, artist and genre 
# using an attr_access 
class Song 
    attr_accessor :name, :artist, :genre
    # Create a class variable to keep track of the number of new songs that are created 
    @@count = 0 
    # Create a class variable to keep track of the genres
    @@genres = []
    # A class varaible to keep track of the artists
    @@artists = []

    # Song.genre_count: returns a hash in which the keys are the names of each genre 
    # Each genre name key should point to a value that is the number of songs that have that genre
    #   Song.genre_count
    #       => {"rap" => 5, "rock" => 1, "country" => 3} 
    # iterate over the @@genres array and populate a hash with the key/value pairs 
    # You'll need to check to see if the hash already contains a key of a particular genre 
    # if so, inrement the value of that key 
    # otherwise create a new key/value pair 
    # You can also look into the # tally method

    # Song.artist_count: returns a histogram similar to the one about, but for artists
    def initialize(song_name, artist, genre)
        @name = song_name 
        @artist = artist 
        @genre = genre
        @@count += 1
        @@genres << genre
        @@artists << artist
    end

    #Class method that returns the count
    def self.count 
        @@count 
    end

    def self.genres 
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end

    def self.artist_count 
        artist_count = {}
        @@artists.each do |artist|
            if artist_count[artist]
                artist_count[artist] += 1 
            else
                artist_count[artist] = 1 
            end
        end
        artist_count 

        # with #tally 
        # @@artist.tally 
    end

    def self.genre_count 
        genre_count = {}
        @@genres.each do |genre|
            if genre_count[genre]
                genre_count[genre] += 1 
            else
                genre_count[genre] = 1 
            end 
        end
            genre_count 

        #with #tally 
        # @@genre.tally
    end

end

ninety_nine_problems = Song.new("99 Problems", "Jay-Z", "rap")
p ninety_nine_problems.name # => "99 Problems"
p ninety_nine_problems.artist # => "Jay-Z"
p ninety_nine_problems.genre # => "rap" 
p Song.count #=> 1
p Song.genres #=> ["rap"]
p Song.artists #=> ["Jay-Z"]

hit_me = Song.new('hit me baby one more time', 'Brittany Spears', 'pop')
lucifer = Song.new("Lucifer", "Jay-Z", "rap")
p Song.count #=> 3
p Song.genres #=> ["rap", "pop"]
p Song.artists #=> ["Jay-Z", "Brittany Spears"]
p Song.artist_count #=> {"Jay-Z"=>2, "Brittany Spears"=>1}
p Song.genre_count #=> {"rap"=>2, "pop"=>1}
