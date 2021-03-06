module SexySettings
  # Used internally to ensure examples get reloaded between multiple runs in
  # the same process.
  def self.reset
    self.configuration.class::DEFAULT_OPTIONS.keys.each{|key| self.configuration.send("#{key}=", nil)}
  end

  # Returns the global configuration object
  def self.configuration
    @configuration ||= SexySettings::Configuration.new
  end

  # Yields the global configuration object
  #
  # == Examples
  #
  # SexySettings.configure do |config|
  #   config.env_variable_with_options = 'OPTIONS'
  # end
  def self.configure
    if block_given?
      yield configuration
    else
      self.configuration
    end
  end
end