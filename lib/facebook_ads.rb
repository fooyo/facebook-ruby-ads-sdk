# External requires.
require 'json'
require 'rest-client'
require 'hashie'
require 'logger'

# Internal requires.
require 'facebook_ads/base'
Dir[File.expand_path('../facebook_ads/*.rb', __FILE__)].each { |f| require f }

# The primary namespace for this gem.
module FacebookAds
  def self.logger=(logger)
    @logger = logger
  end

  def self.logger
    unless defined?(@logger)
      @logger       = Logger.new('/dev/null')
      @logger.level = Logger::Severity::UNKNOWN
    end

    @logger
  end

  def self.base_uri=(base_uri)
    @base_uri = base_uri
  end

  def self.base_uri
    @base_uri = 'https://graph.facebook.com/v2.8' unless defined?(@base_uri)
    @base_uri
  end

  def self.access_token=(access_token)
    @access_token = access_token
  end

  def self.access_token
    # @access_token = 'EAAHeXJkjBigBAJCDR7Q9uji9YBs7dEIK697ALCNtX5UJjshZA1IbLDTZAL7xbNloqub4yG4n9IvaLG3aQgeqlHQFswMXvZAmTEQlZAW6pSPynvQrSt8VoM2YajHGkY7ritlSRGe2cUGnihABQZABuw7u8y0RRWuwBEsrHhMs4nwZDZD'
    @access_token = 'EAAHeXJkjBigBAKBaZB2ABWYhtPhEZCEuw3QANpuYvWWiKcaFENG5DFzhLsgpPmTyZCBTZBz1qUIkZCe3JrYuBOEsuZClQdO63vTxmhNxlGGRywmnRv0QIi1bq4lzwzESUToZAAoS39MTlJ1kF3I2yO8bq2YPpfDZBs9F5P8Op2LIAAZDZD'
    @access_token
  end

  def self.business_id=(business_id)
    @business_id = business_id
  end

  def self.business_id
    @business_id
  end
end
