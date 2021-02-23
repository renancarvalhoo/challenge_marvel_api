require "test_helper"

class ComicTest < ActiveSupport::TestCase
  test 'serialize comic' do
    Time.stub :now, Time.zone.parse("2021-02-23 13:11:56 UTC") do
      VCR.use_cassette(:comics) do
        response = Marvel::Client.new('get', 'comics', {}).fetch
        assert response['results']
        comic_struct = Comic.new(response['results'].third)
        assert comic_struct.thumb_path
        assert comic_struct.image?
      end
    end
  end
end
