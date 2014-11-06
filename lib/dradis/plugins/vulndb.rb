module Dradis
  module Plugins
    module Vulndb
      # class Configuration < ::Core::Configurator
      #   configure namespace: 'vulndb'
      #   setting :hq_rest_url, default: 'https://youremail%40emaildomain.com:password@user.vulndbhq.com'
      # end
    end
  end
end

require 'dradis/plugins/vulndb/engine'
require 'dradis/plugins/vulndb/filters'
require 'dradis/plugins/vulndb/version'
