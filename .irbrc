if defined?(Rails) && Rails.env
  load File.join(File.dirname(__FILE__), '.irb-railsrc')
end
