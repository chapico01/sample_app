require 'rails_helper'
require 'spec_helper'

RSpec.describe StaticPagesController, type: :controller do

  before do
    #@base_title = "Ruby on Rails Tutorial Sample App"
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end
  render_views

  describe "get access" do
    it 'shoud get home' do
      visit root_path
      expect(response).to be_success
      expect(page).to have_title("#{@base_title}")
    end
    it 'shoud get help' do
      visit help_path
      expect(response).to be_success
      expect(page).to have_title("Help | #{@base_title}")
    end
    it 'shoud get about' do
      visit about_path
      expect(response).to be_success
      expect(page).to have_title("About | #{@base_title}")
    end
    it 'shoud get contact' do
      #get :contact
      visit contact_path
      expect(response).to be_success
      #assert_select "title", "Contact | #{@base_title}"
      expect(page).to have_title("Contact | #{@base_title}")
    end

  end

end
