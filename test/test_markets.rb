require 'minitest/autorun'
require 'buda_api'

class MarketsTest < Minitest::Test
  def setup
    @market_id = 'btc-clp'
  end
  def test_markets_returns_array
    result = BudaApi::Markets.markets
    assert_kind_of Array, result
  end

  def test_market_returns_hash
    result = BudaApi::Markets.market @market_id
    assert_kind_of Hash, result
  end

  def test_market_returns_proper_market
    result = BudaApi::Markets.market @market_id
    assert_equal result['name'], @market_id
  end

  def test_volume_returns_hash
    result = BudaApi::Markets.volume @market_id
    assert_kind_of Hash, result
  end

  def test_ticker_returns_hash
    result = BudaApi::Markets.ticker @market_id
    assert_kind_of Hash, result
  end

  def test_order_book_returns_hash
    result = BudaApi::Markets.order_book @market_id
    assert_kind_of Hash, result
  end
end