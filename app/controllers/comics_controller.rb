class ComicsController < ApplicationController
  def index
    @comics = Marvel.characters(offset: 0, limit: 20).fetch
  end
end
