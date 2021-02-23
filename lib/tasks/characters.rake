# require_relative '../../app/api/marvel'
# require_relative '../../app/api/marvel/client'
# require_relative '../../app/api/marvel/http_status_codes'
# require_relative '../../app/api/marvel/http_status_messages'
# require_relative '../../app/api/marvel/api_exceptions'
# require_relative '../../app/api/marvel/api_exception_error'

namespace :marvel do
  desc "Check if there is a new character on marvel api"
  task :characters do
    LIMIT = 100
    Rails.application.initialize!
    marvel_response = Marvel.characters(limit: LIMIT, offset: 0).fetch
    pages = marvel_response['total'] / 100

    if marvel_response['total'] == Character.count
      puts 'Doesnt has any different hero !'
      return
    end
    parsed_characters = marvel_response['results'].map do |marvel_character|
      { name: marvel_character['name'], marvel_id: marvel_character['id'] }
    end
    characters = [parsed_characters]

    ActiveRecord::Base.transaction do
      (1..pages).each do |page|
        page = page * LIMIT
        characters << Marvel.characters(limit: LIMIT, offset: page).fetch['results'].map do |marvel_character|
          { name: marvel_character['name'], marvel_id: marvel_character['id']}
        end

        sleep(3)
      end
    end

    characters.flatten.each do |character|
      Character.find_or_create_by(character)
    end
  end
end

# desc "I am short, but comprehensive description for my cool task"ra
# task task_name: [:prerequisite_task, :another_task_we_depend_on] do
#   # All your magic here
#   # Any valid Ruby code is allowed
# end