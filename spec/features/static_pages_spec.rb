require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  scenario "visit static_pages home" do
    visit root_path
    has_link?(root_path)
    has_link?(help_path)
    has_link?(about_path)
    has_link?(contact_path)
    click_link "Contact"
    expect(page).to have_title("Contact | #{@base_title}")
    click_link "Home"
    expect(page).to have_title("#{@base_title}")
    click_link "Sign up now!"
    expect(page).to have_title("Sign up | #{@base_title}")
  end
end
