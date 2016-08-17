module GitWand
  module CLI
    module Command
      module CurrentUserInfo

        def self.perform(client:)
          result = client.current_user_info
          if result.success?
            puts "[success] Current user info"
            puts "- username: #{result.body["login"]}"
            puts "- profile URL: #{result.body["html_url"]}"
          else
            puts "[error] #{result.body["message"]}"
          end
        end

      end
    end
  end
end
