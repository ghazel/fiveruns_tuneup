deps = defined?(ActiveSupport::Dependencies) ? ActiveSupport::Dependencies : Dependencies
deps.load_paths.unshift File.dirname(__FILE__)

# hack for Rails < 2.3 compatability.
class String
  if not instance_methods.include?("html_safe!")
    def html_safe!
      self
    end
  end
end
