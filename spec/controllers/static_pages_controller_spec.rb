require 'rails_helper'
#require 'spec_helper'

RSpec.describe StaticPagesController, type: :controller do

  before do
    #@base_title = "Ruby on Rails Tutorial Sample App"
    @base_title = 'Ruby on Rails Tutorial Sample App'
  end
  render_views

  describe "get access" do
    it 'root path test' do
      redirect_to root_path
      expect(response).to be_success
#      assert_select "title", "Home | #{@base_title}"

    end

    it 'shoud get home' do
      #visit '/staic_pages/home'
      get :home
      expect(response).to be_success
      #assert_select "title", "#{@base_title}"
      assert_select "title", "Ruby on Rails Tutorial Sample App"
    end
    it 'shoud get help' do
      #visit '/static_pages/help'
      get :help
      expect(response).to be_success
      assert_select "title", "Help | #{@base_title}"
    end
    it 'shoud get about' do
      #visit '/static_pages/about'
      get :about
      expect(response).to be_success
      assert_select "title", "About | #{@base_title}"
    end
    it 'shoud get contact' do
      #visit '/static_pages/about'
      get :contact
      expect(response).to be_success
      assert_select "title", "Contact | #{@base_title}"
    end

  end

end
