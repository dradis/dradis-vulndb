require_relative 'gem_version'

module Dradis::Plugins::Vulndb
  # Returns the version of the currently loaded Vulndb as a
  # <tt>Gem::Version</tt>.
  def self.version
    gem_version
  end
end
