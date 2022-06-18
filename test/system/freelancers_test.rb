require "application_system_test_case"

class FreelancersTest < ApplicationSystemTestCase
  setup do
    @freelancer = freelancers(:one)
  end

  test "visiting the index" do
    visit freelancers_url
    assert_selector "h1", text: "Freelancers"
  end

  test "should create freelancer" do
    visit freelancers_url
    click_on "New freelancer"

    fill_in "Bio", with: @freelancer.bio
    fill_in "Cost", with: @freelancer.cost
    check "Featured" if @freelancer.featured
    fill_in "First name", with: @freelancer.first_name
    fill_in "Last name", with: @freelancer.last_name
    click_on "Create Freelancer"

    assert_text "Freelancer was successfully created"
    click_on "Back"
  end

  test "should update Freelancer" do
    visit freelancer_url(@freelancer)
    click_on "Edit this freelancer", match: :first

    fill_in "Bio", with: @freelancer.bio
    fill_in "Cost", with: @freelancer.cost
    check "Featured" if @freelancer.featured
    fill_in "First name", with: @freelancer.first_name
    fill_in "Last name", with: @freelancer.last_name
    click_on "Update Freelancer"

    assert_text "Freelancer was successfully updated"
    click_on "Back"
  end

  test "should destroy Freelancer" do
    visit freelancer_url(@freelancer)
    click_on "Destroy this freelancer", match: :first

    assert_text "Freelancer was successfully destroyed"
  end
end
