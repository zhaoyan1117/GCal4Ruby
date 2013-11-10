module GCal4Ruby

  class Configuration

    def self.property(name, default_value = nil)
      attr_writer name

      define_method name do
        current_value = instance_variable_get("@#{name}")
        current_value.nil? ? default_value : current_value
      end
    end

    property :username
    property :password

  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

end
