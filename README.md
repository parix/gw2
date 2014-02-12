# The Guild Wars 2 API Gem
[![Gem Version](https://badge.fury.io/rb/gw2.png)](http://badge.fury.io/rb/gw2)
[![Code Climate](https://codeclimate.com/github/parix/gw2.png)](https://codeclimate.com/github/parix/gw2)
[![Build Status](https://travis-ci.org/parix/gw2.png?branch=master)](https://travis-ci.org/parix/gw2)
[![Coverage Status](https://coveralls.io/repos/parix/gw2/badge.png?branch=master)](https://coveralls.io/r/parix/gw2?branch=master)

A Ruby interface for accessing the Guild Wars 2 API.

## Installation

    gem install gw2


## Dynamic Event API

**Get all dynamic events**

```ruby
GW2::Event.all
```

**Get all dynamic events from a specific world**

```ruby
GW2::Event.where(world_id: 1013)
```

**Get all dynamic events from a specific map**

```ruby
GW2::Event.where(map_id: 39)
```

**Get instances of a specific dynamic event**

```ruby
GW2::Event.where(event_id: "F5D23902-2D9A-4B58-8B7D-1EEA0067134D")
```

Note: you can use any combination of world_id, map_id and event_id for querying dynamic events.

**Get all names of events, maps or worlds**

```ruby
GW2::Event.event_names
GW2::Event.map_names
GW2::Event.world_names
```

## Guild API

**Get details of a guild**

```ruby
GW2::Guild.details(guild_id: "16DB5921-CF1B-48D2-A5A0-2F0AADD9765D")
GW2::Guild.details(guild_name: "Ruinous")
```

## Item and Recipe Database API

**Get all discovered items**

```ruby
GW2::Item.all
```

**Get details of a specific item**

```ruby
GW2::Item.details(38875)
```

**Get all discovered recipes**

```ruby
GW2::Recipe.all
```

**Get details of a specific recipe**

```ruby
GW2::Recipe.details(1275)
```

## Map Information API

**Get details of all the continents**

```ruby
GW2::Map.continents
```

**Get all maps**

```ruby
GW2::Map.all
```

**Get details about a specific map**

```ruby
GW2::Map.where(map_id: 80)
```

**Get details about a map floor**

```ruby
GW2::Map.map_floor(1, 1)
```

## World vs World API

**Get all current matches**

```ruby
GW2::WvW.matches
```

**Get details of a specific match**

```ruby
GW2::WvW.match_details("1-5")
```

**Get all objective names**

```ruby
GW2::WvW.objective_names
```


## Miscellaneous API

**Get the current build id**

```ruby
GW2::Misc.build
```

**Get a list of all dyes**

```ruby
GW2::Misc.colors
```

**Get commonly requested assets**

```ruby
GW2::Misc.files
```

## Copyright
Copyright (c) 2013-2014 Chris Rosario.
See [LICENSE][] for details.

[license]: LICENSE.md
