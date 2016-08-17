module GitWand
  module CLI
    module Command
      module DeleteRepository

        def self.perform(client:, repository_name:)
          result = client.delete_repository(name: repository_name)
          if result.success?
            puts "[success] Repository #{repository_name} deleted"
          else
            puts "[error] #{result.body["message"]}"
          end
        end

      end
    end
  end
end
