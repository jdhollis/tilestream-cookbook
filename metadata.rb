maintainer       "J.D. Hollis"
license          "Apache 2.0"
description      "Installs/configures TileStream"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"
depends          "nodejs"

grouping "tilestream",
  :title => "TileStream",
  :description => "TileStream is a high-performance map tile server powered by MBTiles files."

attribute "tilestream/host",
  :display_name => "Host",
  :description => "Hostnames allowed for requests. Wildcards are allowed.",
  :default => '["127.0.0.1","localhost"]'

attribute "tilestream/ui_port",
  :display_name => "UI server port",
  :description => "UI server port.",
  :default => "8888"

attribute "tilestream/tile_port",
  :display_name => "Tile server port",
  :description => "Tile server port.",
  :default => "8888"

attribute "tilestream/subdomains",
  :display_name => "Subdomains",
  :description => "Comma separated list of subdomains to use for tiles.",
  :default => ""

attribute "tilestream/tiles",
  :display_name => "Tiles directory",
  :description => "Path to tiles directory.",
  :default => "~/Documents/MapBox/tiles"
  
attribute "tilestream/accesslog",
  :display_name => "Access log",
  :description => "Print every request to stdout.",
  :default => "false"

attribute "tilestream/tilesets",
  :display_name => "Tilesets",
  :description => "Filenames and URLs of tilesets to download to the tiles directory.",
  :default => ""

attribute "tilestream/cloud",
  :display_name => "Cloud?",
  :description => "Is this a cloud server? If so, set :host to the public hostname of the server.",
  :default => "false"
