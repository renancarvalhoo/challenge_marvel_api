module Marvel
  class Client
    include HttpStatusCodes
    include HttpStatusMessages

    API_ENDPOINT           = 'https://gateway.marvel.com/v1/public/'.freeze
    MARVEL_API_KEY         = ENV['MARVEL_API_KEY']
    MARVEL_PRIVATE_API_KEY = ENV['MARVEL_PRIVATE_API_KEY']

    attr_accessor :http_method, :endpoint, :params

    def initialize(http_method, endpoint, params)
      @http_method = http_method
      @endpoint    = endpoint
      @params      = params
    end

    def fetch
      request
    end

    private

    def client
      @client ||= Faraday.new(API_ENDPOINT) do |connection|
        connection.request :url_encoded
        connection.adapter Faraday.default_adapter
      end
    end

    def request
      Rails.cache
      response = client.public_send(http_method, endpoint, params.merge(auth))

      parsed_response = Oj.load(response.body)

      return parsed_response['data'] if response_successful?(parsed_response)

      raise ApiError, "Code: #{response.status}, response: #{response.body}"
    end

    def auth
      ts = timestamp
      { ts: ts, apikey: MARVEL_API_KEY, hash: hash(ts) }
    end

    def hash(ts)
      Digest::MD5.hexdigest(ts + MARVEL_PRIVATE_API_KEY + MARVEL_API_KEY)
    end

    def timestamp
      Time.now.to_s
    end

    def response_successful?(response)
      response['code'] == HTTP_OK_CODE
    end
  end
end
