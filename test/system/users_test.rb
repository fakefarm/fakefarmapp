require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "User"
  end

  describe 'New User signup flow' do
    test 'flow from root path to show page' do
      visit root_path
      click_link 'join'
      enter_and_sumbit_form_data
      assert_selector "#notice", text: 'User was successfully created.'
    end

    test 'content on the new user page' do
      visit new_user_path
      assert_selector "h1", text: "Join the Farm!"
    end

    test 'content on the show page after signing up' do
      visit new_user_path
      enter_and_sumbit_form_data
      assert_selector "p", text: "don mattingly"
      assert_selector "p", text: "don@mattingly.com"
    end
  end

  def enter_and_sumbit_form_data
    fill_in 'Name', with: 'don mattingly'
    fill_in 'Email', with: 'don@mattingly.com'
    fill_in 'Password', with: 'letmein'
    fill_in 'Password confirmation', with: 'letmein'
    click_button 'Create User'
  end
end
