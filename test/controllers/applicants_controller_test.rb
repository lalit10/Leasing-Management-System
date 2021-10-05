require "test_helper"

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = applicants(:one)
  end

  test "should get index" do
    get applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_url
    assert_response :success
  end

  test "should create applicant" do
    assert_difference('Applicant.count') do
      post applicants_url, params: { applicant: { applicant_id: @applicant.applicant_id, email_address: @applicant.email_address, name: @applicant.name, password: @applicant.password, phone_number: @applicant.phone_number, property_applied: @applicant.property_applied, property_occupied: @applicant.property_occupied } }
    end

    assert_redirected_to applicant_url(Applicant.last)
  end

  test "should show applicant" do
    get applicant_url(@applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_url(@applicant)
    assert_response :success
  end

  test "should update applicant" do
    patch applicant_url(@applicant), params: { applicant: { applicant_id: @applicant.applicant_id, email_address: @applicant.email_address, name: @applicant.name, password: @applicant.password, phone_number: @applicant.phone_number, property_applied: @applicant.property_applied, property_occupied: @applicant.property_occupied } }
    assert_redirected_to applicant_url(@applicant)
  end

  test "should destroy applicant" do
    assert_difference('Applicant.count', -1) do
      delete applicant_url(@applicant)
    end

    assert_redirected_to applicants_url
  end
end
