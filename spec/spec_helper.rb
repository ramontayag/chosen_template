ROOT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
SPEC_DIR = File.expand_path(File.dirname(__FILE__))

require 'rspec'
require File.join(SPEC_DIR, 'dummy', 'config', 'environment')
require 'bundler/setup'
require 'chosen_template'

Bundler.require(:test)

Dir[File.join(SPEC_DIR, 'support', "**/*.rb")].each do |f|
  require f
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = 'random'

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    Timecop.return
  end

  config.after do
    DatabaseCleaner.clean
  end

end
