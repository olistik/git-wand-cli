# GitWand::Cli

Command line interface for [GitWand](https://github.com/olistik/git_wand), a Ruby client for the GitHub API.

## Installation

Install the Gem:

    $ gem install git_wand-cli

## Usage

Self-explanatory:

```shell
ಠ_ಠ git-wand current_user_info
[success] Current user info
- username: olistik
- profile URL: https://github.com/olistik
```

```shell
ಠ_ಠ ./git-wand create foo
[success] Repository foo created
- HTML URL: https://github.com/olistik/foo
- SSH URL: git@github.com:olistik/foo.git
```

```shell
ಠ_ಠ ./git-wand delete foo
[success] Repository foo deleted
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/git_wand-cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

Made with <3 by [olistik](https://olisti.co).

The gem is available as open source under the terms of the [GNU Affero General Public License](LICENSE.txt) ([gnu.org](https://www.gnu.org/licenses/agpl-3.0.txt)).
