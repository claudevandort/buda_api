require 'net/http'
require 'json'
require 'buda_api/markets'

module BudaApi
  BUDA_URL = 'https://www.buda.com/'
  API_PATH = 'api/v2/'
  BUDA_API_URL = BUDA_URL + API_PATH
end