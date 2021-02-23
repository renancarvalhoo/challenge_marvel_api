require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test 'create character' do
    assert_difference('Character.count') do
      Character.create(name: 'Good Hero', marvel_id: 123)
    end
  end

  test 'update character' do
    character = Character.create(name: 'Bad Hero', marvel_id: 123_45)

    character.update(name: 'Super Hero')

    assert Character.find_by(name: 'Super Hero', marvel_id: 123_45)
  end

  test 'delete character' do
    character = Character.create(name: 'Bad Hero', marvel_id: 123_45)

    character.delete

    assert_nil Character.find_by(name: 'Bad Hero', marvel_id: 123_45)
  end
end
