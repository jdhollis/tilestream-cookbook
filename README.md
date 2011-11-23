# Description

Installs/configures [TileStream](https://github.com/mapbox/tilestream)

# Requirements

Requires [jdhollis/nodejs-cookbook](https://github.com/jdhollis/nodejs-cookbook)

# Attributes

* tilestream[:host] - Hostnames allowed for requests. Wildcards are allowed.
* tilestream[:ui_port] - UI server port.
* tilestream[:tile_port] - Tile server port.
* tilestream[:subdomains] - Comma separated list of subdomains to use for tiles.
* tilestream[:tiles] - Path to tiles directory.
* tilestream[:accesslog] - Print every request to stdout.

# Usage

Add it directly to a role or use:

```ruby
include_recipe "tilestream"
```
