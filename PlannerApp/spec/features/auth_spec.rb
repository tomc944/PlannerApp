require 'rails_helper'
require 'spec_helper'

def sign_up(username)
  User.create(username: username, password: "password")
end

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      fill_in "Username", with: "Gizmo"
      fill_in "Password", with: "password"
      click_button "Sign Up"
      expect(page).to have_content "Gizmo"
    end

  end

end

feature "logging in" do
  it "shows username on the homepage after login" do
    sign_up("Gizmo")
    visit '/session/new'
    fill_in "Username", with: "Gizmo"
    fill_in "Password", with: "password"
    click_button "Sign In"
    expect(page).to have_content "Gizmo"
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit '/session/new'
    expect(page).to_not have_content'Log Out'
  end


  it "doesn't show username on the homepage after logout" do
    sign_up("Gizmo")
    visit '/session/new'
    fill_in "Username", with: "Gizmo"
    fill_in "Password", with: "password"
    click_button "Sign In"
    click_button "Log Out"
    expect(page).to_not have_content 'Gizmo'
  end

end
