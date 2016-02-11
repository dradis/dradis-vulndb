module Dradis::Plugins::Vulndb::Filters
  class FullTextSearch < Dradis::Plugins::Import::Filters::Base
    def query(params={})
      results = []

      # In case the user has changed the vulndb:rest_url setting we re-read
      # it every time
      rest_url = URI::parse(Dradis::Plugins::Vulndb::Engine::settings.hq_rest_url)

      client = ::VulnDBHQ::client
      client.host = "https://#{rest_url.host}"
      client.user = CGI::unescape(rest_url.user)
      client.password = CGI::unescape(rest_url.password)

      begin
        results += client.private_pages(q: params[:query]).collect do |page|
          Dradis::Plugins::Import::Result.new(
            description: page.content.dup,
                  title: "[pri] #{page.name}",
                   tags: ["!f89406_private"]
          )
        end
        results += client.public_pages(:q => params[:query]).collect do |page|
          Dradis::Plugins::Import::Result.new(
            description: page.content.dup,
                  title: "[pub] #{page.name}",
                   tags: ['!468847_public']
          )
        end
      rescue Exception => e
        results << Dradis::Plugins::Import::Result.new(
                    title: 'Error fetching records',
                    description: e.message
                    )
      end
      return results
    end
  end
end

Dradis::Plugins::Import::Filters.add :vulndb, :full_text_search, Dradis::Plugins::Vulndb::Filters::FullTextSearch
