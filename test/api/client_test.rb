require 'test_helper'

class ClientTest < Minitest::Test
  def setup
    @channel = Marvel::Client
  end

  def test_client_path
    Time.stub :now, Time.zone.parse("2021-02-23 13:11:56 UTC") do
      VCR.use_cassette(:characters) do
        response = @channel.new('get', 'characters', {}).fetch
        assert response['results']
        assert_equal marvel_payload_keys, response.keys
      end
    end
  end

  def test_client_api_error
    Time.stub :now, Time.zone.parse('2021-02-23 13:11:56 UTC') do
      VCR.use_cassette(:characters_error) do
        assert_raises(Marvel::Exceptions::ApiError) { @channel.new('get', 'characters', { wrong: 'parameter' }).fetch }
      end
    end
  end

  private

  def marvel_payload_keys
    ["offset", "limit", "total", "count", "results"]
  end
end