# Easy Reference Data

Used for creating a predefined set of model instances, similar to db:seed, but will update records if entries already exist.

## Installation

Add this line to your application's Gemfile:

    gem 'easy_reference_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_reference_data

## Usage

Place references in 'db/reference/'

References will be loaded in ascending order, so if an order is desired, prepend 000, 001, 002... etc to the filename.

Run with:
    rake easy:reference_data:refresh

## Deployment

Add this line to your application's deploy.rb file:

    require 'easy/reference_data/capistrano'

## Example

The below example ensures that there are 3 users existing in the database after running the 'rake reference_data:load'

    ### db/reference/000_users.rb
    Easy::ReferenceData.refresh User, :system_code, 'nigel', name: 'Nigel Ramsay', email: 'nigel.ramsay@mailinator.com'
    Easy::ReferenceData.refresh User, :system_code, 'fred', name: 'Fred Schmitt', email: 'fred.schmitt@mailinator.com'
    Easy::ReferenceData.refresh User, :system_code, 'bert', name: 'Bert Symthe', email: 'bert.smythe@mailinator.com'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
