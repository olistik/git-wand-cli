require "git_wand"
require "git_wand/cli/version"
require "git_wand/cli/utils"
require "git_wand/cli/command"
require "optparse"
require "json"

module GitWand
  module CLI

    SEARCH_CONFIG_PATHS = [
      "./.git_wand.json",
      "~/.git_wand.json",
    ]

    def self.perform(options: [])
      arguments = {
        private: false,
      }

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: git-wand [options]"

        opts.on("--current-user-info", "Shows current user info") do
          arguments[:command] = :current_user_info
        end

        opts.on("--create-repository REPOSITORY_NAME", "creates a repository with the given name, for the current user") do |repository_name|
          arguments[:command] = :create_repository
          arguments[:repository_name] = repository_name
        end

        opts.on("--private", "when creating a repository, sets it as private") do
          arguments[:private] = true
        end

        opts.on("--delete-repository REPOSITORY_NAME", "delete a repository with the given name, owned by the current user") do |repository_name|
          arguments[:command] = :delete_repository
          arguments[:repository_name] = repository_name
        end

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end

      opt_parser.parse!(options)

      if Utils.blank?(arguments[:command])
        puts opt_parser
        exit 1
      end

      result = load_config_file
      case result[:status]
      when :config_not_found
        setup_config_file(config_path: result[:candidate_path])
        exit 0
      when :error
        exit 1
      when :ok
        username = result[:data]["github_username"]
        token = result[:data]["github_token"]
      end

      client = GitWand::GitHub::API::Client.new(
        username: username,
        token: token
      )

      Command.perform(arguments: arguments, client: client)
    end

    private

      def self.load_config_file
        search_config_paths = SEARCH_CONFIG_PATHS.map do |relative_path|
          File.expand_path(relative_path)
        end
        config_path = search_config_paths.find {|path| File.exists?(path)}
        if !config_path
          return {
            status: :config_not_found,
            candidate_path: SEARCH_CONFIG_PATHS.first
          }
        end
        puts "Using config file: #{config_path}"
        config_content = JSON.parse(File.read(config_path))
        if !Utils.present?(config_content["github_username"], config_content["github_token"])
          puts "Error: #{config_path} must provide non empty values for \"github_username\" and \"github_token\"."
          return {
            status: :error
          }
        end
        {
          status: :ok,
          data: config_content
        }
      end

      def self.setup_config_file(config_path:)
        puts "Warning: no config file found at\n\t#{SEARCH_CONFIG_PATHS.inspect}\nCreating one at:\n\t#{config_path}."
        default_data = {
          "github_username" => "",
          "github_token" => ""
        }
        File.write(config_path, JSON.pretty_generate(default_data))
        puts "Empty config written, please insert valid credentials and re-run the command."
      end

  end
end
