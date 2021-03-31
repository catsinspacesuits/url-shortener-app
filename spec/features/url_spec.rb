require "rails_helper"

RSpec.feature "Generate short url", type: :feature do
  scenario "With valid input" do
    visit "/urls/new"
    fill_in("Please use format", with: 'https://test.com/testing')
    click_button "create shortened url!"

    expect(page).to have_text("Here is your shortened URL!")
  end

  scenario "With invalid input" do
    visit "/urls/new"
    fill_in("Please use format", with: 'https://test')
    click_button "create shortened url!"

    expect(page).to have_text("Please use a regular format")
  end
end