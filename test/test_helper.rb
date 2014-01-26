ENV["RAILS_ENV"] = "test"
require "devise"
require "devise/version"
require "active_support/core_ext/module/attribute_accessors"

require "devise/inactivatable/inactivatable"

require "minitest/autorun"
require "minitest/unit"

require "mocha/setup"

require "rails_app/config/environment"

require 'support/assertions'
require 'support/factories'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)

ActiveRecord::Migrator.migrate(File.expand_path("test/rails_app/db/migrate"))