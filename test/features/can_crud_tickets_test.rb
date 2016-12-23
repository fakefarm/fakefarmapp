require "test_helper"

class CanCrudTicketsTest < Capybara::Rails::TestCase
  feature 'User successfully creates new ticket' do
    scenario 'starting at root path' do

      # from the homepage
      visit root_path
      click_link 'tickets'
      assert_content page, 'tickets'

      # from tickets, click new
      click_link 'new ticket'
      assert_equal current_path, new_ticket_path

      # from new, fill in form
      ticket = tickets(:one)
      page.fill_in 'Title', :with => ticket.title
      click_button 'Create Ticket'

      # expect to be directed to tickets
      assert_equal current_path, tickets_path
      assert_content page, 'tickets'
      assert_content page, ticket.title
      within('.notice') do
        assert page.has_content?(ticket.title)
      end
    end
  end

    # can be viewed from root
    # can be read from index
    # can be created from index
    # can be read from show page
    # can be edited from show
    # can be deleted from show

end
