require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Address", with: @property.address
    fill_in "Application fee", with: @property.application_fee
    fill_in "Earliest start time", with: @property.earliest_start_time
    check "Features laundry" if @property.features_laundry
    check "Features parking" if @property.features_parking
    check "Features pets" if @property.features_pets
    fill_in "Monthly rent", with: @property.monthly_rent
    fill_in "Name", with: @property.name
    fill_in "Occupied by", with: @property.occupied_by
    fill_in "Size", with: @property.size
    fill_in "Terms available", with: @property.terms_available
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Address", with: @property.address
    fill_in "Application fee", with: @property.application_fee
    fill_in "Earliest start time", with: @property.earliest_start_time
    check "Features laundry" if @property.features_laundry
    check "Features parking" if @property.features_parking
    check "Features pets" if @property.features_pets
    fill_in "Monthly rent", with: @property.monthly_rent
    fill_in "Name", with: @property.name
    fill_in "Occupied by", with: @property.occupied_by
    fill_in "Size", with: @property.size
    fill_in "Terms available", with: @property.terms_available
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end
