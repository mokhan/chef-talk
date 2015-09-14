use Rack::Reloader, 0
use Rack::ContentLength

app = proc do |env|
  response = "[#{ENV['RAILS_ENV']}] hello world #{Time.now.utc}\n"
  [ 200, {'Content-Type' => 'text/plain'}, [response] ]
end

run app
