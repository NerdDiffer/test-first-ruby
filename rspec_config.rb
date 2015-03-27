RSpec.configure do |config|
  config.fail_fast = true
  config.color = true
  config.default_formatter = 'doc'

  # ignore warnings for old-syntax
  config.mock_with :rspec do |c| 
    c.syntax = [:should, :expect]
  end
  config.expect_with :rspec do |c| 
    c.syntax = [:should, :expect]
  end
end
