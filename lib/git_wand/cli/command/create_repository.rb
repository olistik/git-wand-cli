module GitWand
  module CLI
    module Command
      module CreateRepository

        def self.perform(client:, repository_name:, private:)
          parameters = {
            name: repository_name,
            private: private,
          }
          result = client.create_repository(parameters)
          if result.success?
            puts "[success] Repository #{repository_name} created"
            puts "- HTML URL: #{result.body["html_url"]}"
            puts "- SSH URL: #{result.body["ssh_url"]}"
            puts "- Visibility: #{private ? "Private" : "Public"}"
          else
            puts "[error] #{result.body["message"]}"
          end
        end

      end
    end
  end
end
