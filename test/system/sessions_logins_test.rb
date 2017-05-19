require "application_system_test_case"

class SessionsLoginsTest < ApplicationSystemTestCase
  test 'logging in' do
    visit root_path
    click_link 'log in'
    assert_selector "h1", text: "Welcome back!"
  end

  test "logging in with bad credentials" do
    visit login_path
    fill_in 'Email', with: 'don@mattingly.com'
    fill_in 'Password', with: 'letmein'
    click_button 'Log in'
    assert_selector ".notice", text: 'Invalid email/password combination'
  end

  test "logging in with right credentials" do
    user = User.create(name: 'don', email: 'don@mattingly.com', password: 'letmein')
    user.save
    visit login_path
    fill_in 'Email', with: 'don@mattingly.com'
    fill_in 'Password', with: 'letmein'
    click_button 'Log in'
    assert_selector ".notice", text: 'Welcome back jack'
  end
end
