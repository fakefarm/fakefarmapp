require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
  setup do
    # _dw TODO need to figure out how fixtures work.
    # but we see that new didn't save for my test to see it.
    @user = User.create(name: 'donny', email: 'don@mattingly.com', password: 'letmein')
  end

  test 'logging in' do
    visit root_path
    click_link 'Log in'
    assert_selector 'h1', text: 'Welcome back!'
  end

  test 'proper links exist when not logged in' do
    visit root_path
    assert_selector 'a', text: 'Join'
    assert_selector 'a', text: 'Log in'
  end

  test 'proper links exist when logged in' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    assert_selector 'a', text: 'Profile'
    assert_selector 'a', text: 'Log out'
  end


  test 'logging in with bad credentials' do
    visit login_path
    fill_in 'Email', with: 'don@mattingly.com'
    fill_in 'Password', with: 'xxx'
    click_button 'Log in'
    assert_selector '.notice', text: 'Invalid email/password combination'
  end

  test 'logging in with right credentials' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    assert_selector '.notice', text: "Welcome back, #{@user.name}"
  end

  test 'logging out' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'Log out'
    assert_selector '.notice', text: 'You have successfully logged out.'
  end
end
