# Rocket.Chat Notifier Gem
rocket.chat notifier gem, for firing event notifications to a rocket chat incoming webhook.

## Installation

Add this line to your application's *Gemfile*:

```ruby
gem 'rocket-chat-notifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rocket-chat-notifier

create an initializer config *rocket-chat-notifier.rb* to *config/initializers/* and add the following content and add your webhook url:

```ruby
RocketChatNotifier.configure do |config|
  # replace webhook_url with your incoming rocket chat webhook url
  config.webhook_url = "https://my.rocket.chat/hook/WEBHOOK-TOKEN"

  # enable verbose debug information with the following line | default: false
  # config.verbose_mode = true
end
```

And you are ready to go

## Usage

Fire a notification with: `RocketChatNotifier.notify "my message"`

Optional parameters:
* emoji: set a avatar emoji (`ok`, or `smile` e.g.)
* event: set a eventname (will be shown as "username" in rocket.chat)
* attachment: set an attachment
```
  {
    "title": "Rocket.Chat",
    "title_link": "https://rocket.chat",
    "text": "Rocket.Chat, the best open source chat",
    "image_url": "https://rocket.chat/images/mockup.png",
    "color": "#764FA5"
  }
```

Use the optional parameters as named parameters.

Example:

```ruby
RocketChatNotifier.notify 'my message', emoji: 'ok', event: 'my notifier', attachment: {title: 'my att. title', text: 'attachment text', color: '#FF0000'}
```

Additionally you will need a parser script for your rocket.chat for the incoming webhook integration.

If you don't want to code one yourself, here is a working script with basic functionality for you:
https://github.com/cbajohr/rails-rocket-chat-notifier/wiki/rocket.chat---incoming-webhook-parser-script-example


## Post examples

Example JSON that is pushed by the gem.

Possible 'event -> hook' states are:
* starting
* failed
* finished

Simple:
```JSON
{
  "message": "my message\nwith second line",
  "event": "my notifier",
  "emoji": "ok",
  "attachment": {
    "title": "my att. title",
    "text": "attachment text",
    "color": "#FF0000"
  }
}
```

Extended with optional parameters:
```JSON
{
  "message": "my message\nwith second line",
  "event": "my notifier",
  "emoji": "ok",
  "attachment": {
    "title": "my att. title",
    "text": "attachment text",
    "color": "#FF0000"
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cbajohr/rails-rocket-chat-notifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

