require 'httparty'

module WeiboApi
  module Endpoint
    include HTTParty

    BASE_API_URI = 'https://api.weibo.com/2'.freeze

    protected

    def resource_path(id = nil, opts = {})
      suffix = id.to_s
      params = opts.map { |k, v| "#{k}=#{v}" }.join('&')
      "#{BASE_API_URI}/#{suffix}.json?#{params}"
    end

    def make_request(url, options, method = :get)
      response = HTTParty.send(method, url, options)
      return parse_success response if response.success?
      parse_failed response
    end

    private

    def parse_success(response)
      JSON.parse(response.body)
    end

    def parse_failed(response)
      response.parsed_response
    end
  end
end
