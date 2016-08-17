require_relative "command/current_user_info"
require_relative "command/create_repository"
require_relative "command/delete_repository"

module GitWand
  module CLI
    module Command

      def self.perform(arguments:, client:)
        case arguments[:command]
        when :current_user_info
          CurrentUserInfo.perform(client: client)
        when :create_repository
          CreateRepository.perform(client: client, repository_name: arguments[:repository_name], private: arguments[:private])
        when :delete_repository
          DeleteRepository.perform(client: client, repository_name: arguments[:repository_name])
        else
          puts "Command `#{arguments[:command]}` is not recognized."
          exit 1
        end
      end

    end
  end
end
