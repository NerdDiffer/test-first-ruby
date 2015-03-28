#Dir.foreach './lib' do |file| 
#  # skip this iteration if the file name doesn't follow the regex pattern
#  next if file.match(/^(\d){2}_/).nil?
#  require_relative "lib/#{file}"
#end

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
