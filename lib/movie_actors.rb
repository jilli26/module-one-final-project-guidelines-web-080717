class MovieActor < ActiveRecord::Base
  belongs_to :movies
  belongs_to :actors
end
