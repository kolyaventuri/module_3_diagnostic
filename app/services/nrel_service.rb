class NRELService
  def self.make_request(endpoint, params)
    params[:format] = 'JSON'
    conn = Faraday.new(url: build_url(endpoint, params))

    response = conn.get do |req|
      req.headers['X-API-Key'] = ENV['NREL_API_KEY']
    end

    return false unless response.success?

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  API_URL = 'https://developer.nrel.gov/api'

  def self.build_url(endpoint, params)
    "#{API_URL}#{endpoint}?#{params.to_query}"
  end
end
