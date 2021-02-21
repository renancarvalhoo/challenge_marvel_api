module Marvel
  class Client
    include HttpStatusCodes
    include ApiExceptions

    API_ENDPOINT           = 'https://gateway.marvel.com/v1/public/'.freeze
    MARVEL_API_KEY         = ENV['MARVEL_API_KEY']
    MARVEL_PRIVATE_API_KEY = ENV['MARVEL_PRIVATE_API_KEY']

    attr_accessor :http_method, :endpoint

    def initialize(http_method, endpoint)
      @http_method = http_method
      @endpoint = endpoint
    end

    def fetch
      request(
        http_method: http_method,
        endpoint: endpoint
      )
    end

    private

    def error_class

    end

    def client
      @client ||= Faraday.new(API_ENDPOINT) do |connection|
        connection.request :url_encoded
        connection.adapter Faraday.default_adapter
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params.merge(auth))
      Oj.load(response.body)
    end

    def auth
      ts = timestamp
      { ts: times, apikey: MARVEL_API_KEY, hash: hash(ts), limit: 101 }
    end

    def hash(ts)
      Digest::MD5.hexdigest(ts + MARVEL_PRIVATE_API_KEY + MARVEL_API_KEY)
    end

    def timestamp
      Time.now.to_s
    end
  end
end
