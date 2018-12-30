[![Build Status](https://travis-ci.org/nsommer/patternify.svg?branch=master)](https://travis-ci.org/nsommer/patternify)

# Patternify

This ruby gem provides a DSL to describe patterns of regular expressions in a more human readable way.

```ruby
pattern = Patternify::Pattern do
  one_or_many do
    any_char
  end
  
  string "@"
  
  one_or_many do
    negate do
      string "."
    end
  end
  
  string "."
  
  either do
    string "com"
  or do
    string "org"
  or do
    string "net"
  end
end

pattern.to_s

# => .+@[^\.]+.(com|org|net)

pattern.to_regexp.match?("john.doe@example.org")

# => true
```

**Note:** I started this gem for fun and it is higly incomplete and lacks validations and documentation. Pull requests are welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'patternify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install patternify

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nsommer/patternify.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
