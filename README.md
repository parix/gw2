# The Guild Wars 2 API Gem

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

## Copyright
Copyright (c) 2013 Chris Rosario.
See [LICENSE][] for details.

[license]: LICENSE.md
