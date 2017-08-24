require "pry"
class CommandLineInterface

 def add_instance(instance)
   @@all << instance
 end

 def greet
   puts "Welcome to The Movie Game! Name a Movie or an Actor!"
 end

 def gets_user_input
   input = gets.chomp
   input
 end

 def prompt_user
   if @instance.class == Movie
     puts "Name an Actor!"
     @last_entry = @input
     @input = gets_user_input
     @instance = search_movie_or_actor
   else
     puts "Name a Movie!"
     @last_entry = @input
     @input = gets_user_input
     @instance = search_movie_or_actor
   end
 end

 def gameplay
     prompt_user
     @instance = search_movie_or_actor
     if search_movie_or_actor == true
       @game.turns << Turn.create(entry: @input, category: determine_category(@instance))
       self.valid_turn?
     else
       valid_turn?
     end
 end

 def search_movie_or_actor
   Movie.find_by(title: @input) || Actor.find_by(name: @input)
 end

  def check_actor(input)
    actor = Actor.find_by(name: input)
    actor.movies.exists?(title: @last_entry) ? true : false
  end

  def check_movie(input)
    movie = Movie.find_by(title: input)
    movie.actors.exists?(name: @last_entry) ? true : false
  end

  def is_in?
    if @instance.class == Movie
      check_movie(@input)
    elsif @instance.class == Actor
      check_actor(@input)
    else
      false
    end
  end

 def determine_category(instance)
   if instance.class == Movie
     "Movie"
   elsif instance.class == Actor
     "Actor"
   else
     nil
   end
 end

 def alternate?
   if @game.turns.all.length < 2
     true
   elsif @game.turns.last.category != @game.turns.last(2).first.category
     true
   else
     false
   end
 end

 def not_repeat?
   @game.turns.all.length == @game.turns.all.distinct.length ? true : false
 end

 def valid_turn?
   while alternate? && not_repeat? && is_in? do
     gameplay
   end
     puts "Game Over :("
 end

 def run
   @game = Game.create(game_number: 1)
   number = Game.all.last.game_number + 1
   greet
   @input = self.gets_user_input
   @instance = self.search_movie_or_actor
   @game.turns << Turn.create(entry: @input, category: determine_category(@instance))
   gameplay
 end

end
