require 'bundler/setup'
Bundler.require(:default, :development)

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruzai2'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.after :each do
    Ruzai2::RuzaiList.delete_all
  end
end
