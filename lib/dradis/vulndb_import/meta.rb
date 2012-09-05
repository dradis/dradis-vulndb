module Dradis
  module VulndbImport
    module Meta
      NAME = 'Vulnerability Database (VulnDBHq.com)'
      module VERSION #:nodoc:
        MAJOR = 3
        MINOR = 0
        TINY  = 0
        PRE = 'beta'

        STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
        def self.to_s
          STRING
        end
      end
    end
  end
end