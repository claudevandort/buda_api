module BudaApi

  # Markets API
  class Markets

    # Public
    class << self
      def get url = ''
        uri = URI url
        response = Net::HTTP.get_response uri
        body = JSON.parse response.body
        raise StandardError, "[#{url}] => (#{response.code}) #{body['message']}" unless response.code.to_i == 200
        body
      end

      def markets 
        json = get "#{BudaApi::BUDA_API_URL}markets.json"
        json['markets']
      end

      def market market_id
        json = get "#{BudaApi::BUDA_API_URL}markets/#{market_id}.json"
        json['market']
      end

      def volume market_id
        json = get "#{BudaApi::BUDA_API_URL}markets/#{market_id}/volume.json"
        json['volume']
      end

      def ticker market_id
        json = get "#{BudaApi::BUDA_API_URL}markets/#{market_id}/ticker.json"
        json['ticker']
      end

      def order_book market_id
        json = get "#{BudaApi::BUDA_API_URL}markets/#{market_id}/order_book.json"
        json['order_book']
      end

      def trades market_id, limit = 100
        json = get "#{BudaApi::BUDA_API_URL}markets/#{market_id}/trades.json?limit=#{limit}" # 500 when limit is nil 💥
        json['trades']
      end
    end
  end
end