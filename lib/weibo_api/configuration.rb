module WeiboApi
  module Configuration
    OPTIONS = %i[client_id client_secret access_token].freeze

    attr_accessor(*OPTIONS)

    def configure
      yield self
    end
  end
end
