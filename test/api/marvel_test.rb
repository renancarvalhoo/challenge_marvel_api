require "test_helper"

class MarvelTest < Minitest::Test

  def setup
    @marvel = Marvel
  end

  def test_comics_path
    characters = @marvel.comics
    assert characters.instance_of?(Marvel::Client)
    assert_equal 'get', characters.http_method
    assert_equal 'comics', characters.endpoint
  end

  def test_characters_path
    characters = @marvel.characters
    assert characters.instance_of?(Marvel::Client)
    assert_equal 'get', characters.http_method
    assert_equal 'characters', characters.endpoint
  end

  def test_character_path
    character = @marvel.character(1)
    assert character.instance_of?(Marvel::Client)
    assert_equal 'get', character.http_method
    assert_equal 'characters/1', character.endpoint
  end

  def test_character_comics_path
    character_comics = @marvel.character_comics(1)
    assert character_comics.instance_of?(Marvel::Client)
    assert_equal 'get', character_comics.http_method
    assert_equal 'characters/1/comics', character_comics.endpoint
  end
end