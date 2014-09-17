# TumblrReader

Read posts from any Tumblr easily thanks to the xml API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tumblr_reader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tumblr_reader

## Usage

```
tumblr_reader = TumblrReader::Client.new "http://lesjoiesducode.fr/"

random_article = tumblr_reader.get_random_article
=> Article obj, with the following accessors:
random_article.title  # returns "the title of the article"
random_article.body   # returns "html body"
random_article.images # returns ["http://image.com/1st.gif", "http://image.com/2nd.jpg"]
random_article.links  # returns images + ["http://other_links.com"]
random_article.tags   # returns ["1st_tag", "2nd_tag"]

a_specific_article = tumblr_reader.get_article "http://lesjoiesducode.fr/post/:id/slug"
=> Article obj
```

## Contributing

1. Fork it ( https://github.com/otomatik/tumblr_reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
