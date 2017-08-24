# require 'smarter_csv'
# require 'pry'
# require_relative'../config/environment'
#
# filename = './movie_data/movie_data.csv'
# options = {:key_mapping => {:movie_title => :title, :actor_2_name => :name, :actor_1_name => :name1, :actor_3_name => :name2}, :remove_unmapped_keys => true}
# movie_array = SmarterCSV.process(filename, options)
#
# #FIND OR CREATE BY METHODS
# movie_data = movie_array.each do |movie_hash|
#   movie_hash.map do |k, v|
#     if k == :title
#       movie_hash[k] = v.chop
#     end
#   end
# end
#
# movie_data.each do |movie|
#   # binding.pry
#   m = Movie.find_or_create_by(title: movie[:title])
#   a = Actor.find_or_create_by(name: movie[:name])
#   a1 = Actor.find_or_create_by(name: movie[:name1])
#   a2 = Actor.find_or_create_by(name: movie[:name2])
#   MovieActor.find_or_create_by(movie_id: m.id, actor_id: a.id)
#   MovieActor.find_or_create_by(movie_id: m.id, actor_id: a1.id)
#   MovieActor.find_or_create_by(movie_id: m.id, actor_id: a2.id)
# end
#
# # binding.pry
# # 'x'
