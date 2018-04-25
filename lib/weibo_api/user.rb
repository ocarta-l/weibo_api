module WeiboApi
  class User
    include Endpoint

    def initialize(access_token, uid)
      @access_token = access_token
      @uid = uid
    end

    # Return the authenticating user's personnal infos or the one specified on the options (uid).
    def info(options = {})
      params = options.merge(access_token: @access_token, uid: @uid) { |_, important, _| important }
      make_request resource_path('users/show', params), {}
    end

    # Return the authenticating user's followers statistics.
    # [WIP]
    def statistics(options = {})
      params = options.merge(access_token: @access_token, uid: @uid) { |_, important, _| important }
      make_request resource_path('friendships/followers', params), {}
    end

    # Return the authenticating user's latest weibos.
    def timeline(options = {})
      params = options.merge(access_token: @access_token, trim_user: 1) { |_, important, _| important }
      make_request resource_path('statuses/user_timeline', params), {}
    end

    # Return the single weibo's content by its ID
    def show_status(id)
      params = { access_token: @access_token, id: id }
      make_request resource_path('statuses/show', params), {}
    end

    def custom_request(path, options = {})
      params = options.merge(access_token: @access_token) { |_, important, _| important }
      make_request resource_path(path, params), {}
    end
  end
end
