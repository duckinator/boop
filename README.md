# Boop

A git-based pastebin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'boop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install boop

## Configuration

* The directory `~/.boop` should be a git repository.
* The environment variable `BOOP_URL` should be a URL that points to the
  contents of the repository.

## Usage

```
$ ls | boop paste
https://example.com/0011da76692a4cda80c766dd8de6081f.txt
$ echo '<p>hello, world!</p>' | boop html
https://example.com/25950fb63d554c158a93d4c33e4845cb.html
$ echo '<p>hi</p>' | boop html hi
https://example.com/hi.html
```

It changes to the `~/.boop` directory, saves the contents of stdin to the
specified file (using a UUID as the name if no name is specified), and
does a `git push`, prints the URL it should be available at.

It DOES NOT preserve the contents of existing files.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/duckinator/boop. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Boop project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/duckinator/boop/blob/master/CODE_OF_CONDUCT.md).
