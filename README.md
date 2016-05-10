# Demae

**Demae** is Itamae ssh runner for nodes on environment.

This enable:

```
$ bundle exec demae apply staging
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'demae'
```

And then execute:

```
$ bundle
```

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
And modify config/demae/staging.yml.

And then execute:

```
$ bundle exec demae apply staging
```
