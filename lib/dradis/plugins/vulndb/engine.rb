module Dradis::Plugins::Vulndb
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Vulndb

    include ::Dradis::Plugins::Base
    description 'Import entries from you VulnDB HQ repository'
    provides :import
  end
end