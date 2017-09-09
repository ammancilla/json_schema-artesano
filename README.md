# JsonSchema::Artesano

If you give a **sketch, materials and tools** to an Artesano (Artesan), he will use the tools to transform the materials into a product that (hopefully) matches the sketch.

Similary, if you give a **JSON Schema (sketch) and a strategy (tool)** to `JsonSchema::Artesano`, it will give you data (or object, or whatever else you asked for) conformed to the schema.

**Mmm I don't believe you. You didn't give it materials!?**
> Because it has it owns materials!

### **AND HOW COULD THIS BE USEFUL?**
I came up with this after looking for a ruby 'JSON Schema faker' (give it a JSON Schema, get fake data according to the schema) and not finding any that fullfilled my needs. I know this gem is not what I was looking for, but now I can just create a simple strategy to generate fake data, pass it to `JsonSchema::Artesano` and get what I originally wanted. Someone could also create an strategy to generate ruby objects instead or similar.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_schema-artesano'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_schema-artesano

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ammancilla/json_schema-artesano.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
