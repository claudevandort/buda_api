require 'net/http'
require 'json'

class BudaApi
  BUDA_URL = 'https://www.buda.com/'
  API_PATH = 'api/v2/'
  BUDA_API_URL = BUDA_URL + API_PATH

  # Public API
  class << self

    def get url = ''
      uri = URI url
      response = Net::HTTP.get_response uri
      body = JSON.parse response.body
      raise ArgumentError, "[#{url}] => (#{response.code}) #{body['message']}" unless response.code.to_i == 200
      body
    end

    def markets 
      json = get "#{BUDA_API_URL}markets.json"
      json['markets']
    end

    def market market_id
      json = get "#{BUDA_API_URL}markets/#{market_id}.json"
      json['market']
    end

    def volume market_id
      get "#{BUDA_API_URL}markets/#{market_id}/volume.json"
    end

    def ticker market_id
      get "#{BUDA_API_URL}markets/#{market_id}/ticker.json"
    end

    def order_book market_id
      get "#{BUDA_API_URL}markets/#{market_id}/order_book.json"
    end

    def trades market_id, limit = 100
      # 500 when limit is nil 💥
      get "#{BUDA_API_URL}markets/#{market_id}/trades.json?limit=#{limit}" # timestamp param pending
    end
  end
end