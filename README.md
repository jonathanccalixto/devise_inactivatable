# DeviseInactivatable

This is a simple, however wonderful devise extension to activate and inactivate users account.
It is was inspired by extension [devise_deactivatable](https://github.com/thickpaddy/devise_deactivatable).
Thanks to [Mark Woods](https://github.com/thickpaddy) by inspiration

## Installation

Add this line to your application's Gemfile:

    gem 'devise_inactivatable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_inactivatable

## Usage

    u = User.create(:name => 'John Doe', :password => "john.doe")
    u.inactive? # false
    u.active_for_authentication? # true
    u.inactive_message # :inactive
    u.inactivate!
    u.inactive? # true
    u.active_for_authentication? # false
    u.inactive_message # :inactivated

#### Using with ActiveRecord
You need to create a migration, manually (there is no magic here):

    class DeviseInactivatableToUsers < ActiveRecord::Migration
      def up
        add_column :users, :inactivated_at, :timestamp
        add_index :users, :inactivated_at
      end
      def down
        remove_index :users, :inactivated_at
        remove_column :users, :inactivated_at
      end
    end


Include in your model:

    class User < ActiveRecord::Base
      devise :database_authentication, :inactivatable
    end

Adding four wonderful new methods, and modifications to two other methods:

- activate! : active the account if it is inactive
- inactivate! : inactive the account if it is active
- active? : checks whether the account is active
- inactive? : checks whether the account is inactive

## License

The devise_inactivatable is hosted on Github: https://github.com/jonathanccalixto/devise_inactivable, where your contributions, forkings, comments and feedback are greatly welcomed.

Copyright (c) 2014-2014 Agiltec, released under the MIT license.


## Contributing

1. Fork it ( http://github.com/jonathanccalixto/devise_inactivatable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
