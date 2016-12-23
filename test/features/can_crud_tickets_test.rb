require "test_helper"

class CanCrudTicketsTest < Capybara::Rails::TestCase
  feature 'Tickets' do
    # can be viewed from root
    # can be read from index
    # can be created from index
    # can be read from show page
    # can be edited from show
    # can be deleted from show

    scenario 'User can view all tickets' do
      visit tickets_path
      assert_content page, 'tickets'
    end

    scenario 'User can create a new ticket from index' do
      visit tickets_path
      click_link 'new ticket'
      assert_equal current_path, new_ticket_path

      ticket = tickets(:one)
      page.fill_in 'Title', :with => ticket.title
      click_button 'Create Ticket'

      assert_equal current_path, tickets_path
      assert_content page, 'tickets'
    end
  end
end
