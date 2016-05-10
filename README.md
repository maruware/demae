# Demae

Demae is a node manager for itamae.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'demae'
```

And then execute:

    $ bundle

## Initialize

Execute:

```
$ bundle exec demae install
```

Then these files are created.

```
.
└── config
     └── demae
          ├── production.yml
          └── staging.yml

```

## Usage

First, write itamae recipes.
And then execute:

```bash
$ bundle exec demae apply production
```
