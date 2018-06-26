# Pocket in Ruby

----

## Description

CLI tools to operate items in Pocket - by Ruby

## Dependency

* Ruby 2.4.2

## Setup

1. Clone this repository

```bash
git clone git@github.com:piruty/pocket_in_ruby.git
```

2. You have to get consumer key and access token to use Pocket web Api

See [this pocket support page](https://getpocket.com/developer/docs/authentication), and get them.

3. Add consumer key and access token to ENV parameters

Copy your consumer key and access token, then add them to you .bashrc

```bash
echo "POCKET_CONSUMER_KEY=your_consumer_key" >> ~/.bashrc
echo "POCKET_ACCESS_TOKEN=your_access_token" >> ~/.bashrc
```

## Usage

4. Run script

```bash
# Get item randomly and archive it
ruby get_archive_item_randomly .rb

# Archive all items in your Pocket list
ruby archive_all_items.rb
```

## Licence

MIT

## Author

[piruty](https://piruty.com)

## References

[Pocket API: Documentation Overview](https://getpocket.com/developer/docs/overview)
