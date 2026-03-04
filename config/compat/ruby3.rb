require 'bigdecimal'

# Rails 4 expects BigDecimal.new, removed in Ruby 3.
unless BigDecimal.respond_to?(:new)
  class BigDecimal
    def self.new(*args)
      BigDecimal(*args)
    end
  end
end
