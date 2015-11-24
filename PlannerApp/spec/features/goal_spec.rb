require 'byebug'
require 'rails_helper'
require 'spec_helper'

feature "goal creation and private" do
  # let(:user) { User.create!() }

  before :each do
    create_gizmo_and_goal
  end

  scenario "creates a goal and writes it user show page" do
    expect(page).to have_content("learn to juggle")
  end

  scenario "defaults completion status to false" do
    expect(page).to have_content("false")
  end

  scenario "updates a goal" do
    click_button "Update Goal!"
    fill_in "Goal", with: "learn to juggle very well"
    click_button "Edit Goal!"
    expect(page).to have_content("learn to juggle very well")
  end

  scenario "destroys a goal" do
    click_button "Destroy Goal!"
    expect(page).to_not have_content("learn to juggle")
  end

end

feature "private and show pages" do
  before :each do
    create_gizmo_and_goal
    create_private_goal_and_navigate_to_gizmo
  end

  scenario "does not show private goals to other users" do
    expect(page).to_not have_content("learn to ride a bike")
  end

  scenario "does not show create button" do
    expect(page).to_not have_content("Create Goal!")
  end

  scenario "does not show update goal button" do
    expect(page).to_not have_content("Update Goal!")
  end

  scenario "does not show destroy button" do
    expect(page).to_not have_content("Destroy Goal!")
  end

end
