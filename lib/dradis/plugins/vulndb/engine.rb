module Dradis::Plugins::Vulndb
  class Engine < ::Rails::Engine
    isolate_namespace Dradis::Plugins::Vulndb

    include ::Dradis::Plugins::Base
    description 'Import entries from you VulnDB HQ repository'
    provides :import

    addon_settings do
      settings.hq_rest_url = 'https://email%40domain.com:Password%21%21@your.vulndbhq.com'
    end
  end
end