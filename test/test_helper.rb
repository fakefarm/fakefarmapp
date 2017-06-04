ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
Minitest::Reporters.use!

ActiveRecord::Migration.maintain_test_schema!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def assert_permit(user, record, action)
    msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
    assert permit(user, record, action), msg
  end

  def refute_permit(user, record, action)
    msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
    refute permit(user, record, action), msg
  end

  def permit(user, record, action)
    cls = self.class.superclass.to_s.gsub(/Test/, '')
    cls.constantize.new(user, record).public_send("#{action.to_s}?")
  end
end
