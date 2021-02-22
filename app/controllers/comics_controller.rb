class ComicsController < ApplicationController
  def index
    characters = Marvel.characters(offset: 0, limit: 20).fetch

    @comics = characters['results']
  end
end
