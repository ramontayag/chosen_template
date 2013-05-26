require 'factory_girl'
Dir.glob(File.join(SPEC_DIR, 'factories', '**', '*.rb')).each do |f|
  require f
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
