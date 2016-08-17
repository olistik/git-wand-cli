module GitWand
  module CLI
    module Command
      module CreateRepository

        def self.perform(client:, repository_name:)
          result = client.create_repository(name: repository_name)
          if result.success?
            puts "[success] Repository #{repository_name} created"
            puts "- HTML URL: #{result.body["html_url"]}"
            puts "- SSH URL: #{result.body["ssh_url"]}"
          else
            puts "[error] #{result.body["message"]}"
          end
        end

      end
    end
  end
end
