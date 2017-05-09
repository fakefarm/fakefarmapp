require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit users_url

    assert_selector "h1", text: "User"
  end

  test 'New User signup' do
    visit signup_path
    assert_selector "h1", text: "Join the Farm!"
    # _dw TODO learn some capybara to know how to do these kinds of things
    # fill_in 'name' with: 'don@mattingly.com'
  end
end
