require 'redis'
require 'sinatra'

str = "Canal - Estudando DevOps\n"
str = str.chomp
puts str

set(:port, 8000)
set(:bind, '0.0.0.0')

redis = Redis.new(
  host: ENV.fetch('REDIS_HOST', 'localhost'),
  port: ENV.fetch('REDIS_PORT', '6379'),
)

get '/' do
  redis.incr('visits')
  "Estudando DevOps - Visitas: #{redis.get('visits')}"
end
