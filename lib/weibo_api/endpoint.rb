require 'httparty'
require 'hashie'

module WeiboApi
  module Endpoint
    include HTTParty

    BASE_API_URI = 'https://api.weibo.com/2'.freeze

    ERROR_CODES = {
      400 => BadRequest,
      404 => NotFound,
      429 => TooManyRequests,
      500 => InternalServerError,
      502 => BadGateway,
      503 => ServiceUnavailable,
      504 => GatewayTimeout
    }.freeze

    protected

    def resource_path(id = nil, opts = {})
      suffix = id.to_s
      params = opts.map { |k, v| "#{k}=#{v}" }.join('&')
      "#{BASE_API_URI}/#{suffix}.json?#{params}"
    end

    def make_request(url, options, method = :get)
      p url
      response = HTTParty.send(method, url, options)
      return parse_success response if response.success?
      parse_failed response
    end

    private

    def parse_success(response)
      response_hash = JSON.parse(response.body).merge(
        limit: response.headers['x-ratelimit-limit'],
        remaining: response.headers['x-ratelimit-remaining']
      )
      ::Hashie::Mash.new(response_hash)
    end

    def parse_failed(response)
      response.parsed_response
    end
  end
end
