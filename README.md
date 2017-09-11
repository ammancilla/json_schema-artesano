# JsonSchema::Artesano

If you give a **sketch, materials and tools** to an Artesano (Artesan), he will use the tools to transform the materials into a product that (hopefully) matches the sketch.

Similary, if you give a **JSON Schema (sketch) and a strategy (tool)** to `JsonSchema::Artesano`, it will give you data (or objects, or whatever else you ask for) conformed to the schema.

**Mmm I don't believe you. You didn't give it materials!?**
> Because it has it owns materials! (thanks to the `json_schema` gem).

### **AND HOW COULD THIS BE USEFUL?**
I came up with this after looking for a ruby 'JSON Schema faker' (give it a JSON Schema, get fake data according to the schema) and not finding any that fullfilled my needs. I know this gem is not what I was looking for, but now I can just create a simple faker strategy, pass it to `JsonSchema::Artesano` and get what I originally wanted. Someone could also create an strategy to generate ruby objects instead or similar.

## Usage

```ruby
# the sketch
schema = {
    "title": "Person",
    "type": "object",
    "properties": {
        "firstName": { "type": "string" },
        "lastName": { "type": "string" },
        "age": {
            "description": "Age in years",
            "type": "integer",
            "minimum": 0
        },
        "genre": {
            "type": "string",
            "enum": ["male", "female"]
        },
        "married": { "type": "boolean" }
    },
    "required": ["firstName", "lastName"]
}

# the tool
require 'json_schema-artesano/json_schema/artesano/tools/static'

# the product
product = JsonSchema::Artesano.mold(sketch: sketch, tool: JsonSchema::Artesano::Tools::Static)

JSON.pretty_generate(product)

# =>
#
# {
#   "firstName": "Lorem ipsum dolor sit amet",
#   "lastName": "Lorem ipsum dolor sit amet",
#   "age": 22,
#   "genre": "Lorem ipsum dolor sit amet",
#   "married": false
# }
#

```

## Artesano Tools (Strategies)

TODO: Describe how to create strategies and the provided ones.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_schema-artesano'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_schema-artesano

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ammancilla/json_schema-artesano.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
