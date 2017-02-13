# config/initializers/her.rb
Her::API.setup url: "https://boiling-sands-81819.herokuapp.com/" do |c|
  # RequestパラメータをURLエンコードする
  c.use Faraday::Request::UrlEncoded

  # ResponseをJSON形式で返す
  c.use Her::Middleware::DefaultParseJSON

  # Adapterを指定（NetHttp）
  c.use Faraday::Adapter::NetHttp
end
