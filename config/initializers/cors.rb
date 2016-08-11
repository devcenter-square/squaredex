Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ''

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             expose: ['access-token', 'expiry', 'token-type', 'uid', 'client', 'total', 'perPage', 'page', 'If-Modified-Since']
  end
end
