module Dradis::Plugins::Vulndb::Filters
  class FullTextSearch < Dradis::Plugins::Import::Filters::Base
    def query(params={})
      results = []

      # In case the user has changed the vulndb:rest_url setting we re-read
      # it every time
      # FIXME
      # rest_url = URI.parse(Configuration.hq_rest_url)
      rest_url = URI::parse(::Configuration.find_by_name('vulndb:hq_rest_url').value)

      client = VulnDBHQ::client
      client.host = "https://#{rest_url.host}"
      client.user = CGI::unescape(rest_url.user)
      client.password = CGI::unescape(rest_url.password)

      begin
        results += client.private_pages(q: params[:query]).collect do |page|
          Dradis::Plugins::Result.new(
            description: page.content,
                  title: "[pri] #{page.name}",
                   tags: [:private]
          )
        end
        results += client.public_pages(:q => params[:query]).collect do |page|
          Dradis::Plugins::Result.new(
            description: page.content,
                  title: "[pub] #{page.name}",
                   tags: [:public]
          )
        end
      rescue Exception => e
        results << Dradis::Plugins::Result.new(
                    title: 'Error fetching records',
                    description: e.message
                    )
      end
      return results
    end
  end
end

Dradis::Plugins::Import::Filters.add :vulndb, :full_text_search, Dradis::Pro::Vulndb::Filters::FullTextSearch
