require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'User'
    click_link 'Join'
    assert_selector 'h1', text: 'Join the Farm!'
  end

  test 'flow from root path to show page' do
    visit root_path
    click_link 'Join'
    user = { name: 'dad', email: 'dad@woodalls.me' }
    fill_in 'Name', with: user[:name]
    fill_in 'Email', with: user[:email]
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    assert_selector '.notice', text: 'User was successfully created.'
    assert_selector 'p', text: user[:name]
    assert_selector 'p', text: user[:email]
  end
end
