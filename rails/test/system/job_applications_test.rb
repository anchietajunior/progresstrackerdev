require "application_system_test_case"

class JobApplicationsTest < ApplicationSystemTestCase
  setup do
    @job_application = job_applications(:one)
  end

  test "visiting the index" do
    visit job_applications_url
    assert_selector "h1", text: "Job applications"
  end

  test "should create job application" do
    visit job_applications_url
    click_on "New job application"

    fill_in "Applied at", with: @job_application.applied_at
    fill_in "Applied via", with: @job_application.applied_via
    fill_in "Company", with: @job_application.company_name
    fill_in "Contact email", with: @job_application.contact_email
    fill_in "Contact name", with: @job_application.contact_name
    fill_in "Position", with: @job_application.position
    fill_in "Priority", with: @job_application.priority
    fill_in "Status", with: @job_application.status
    fill_in "User", with: @job_application.user_id
    click_on "Create Job application"

    assert_text "Job application was successfully created"
    click_on "Back"
  end

  test "should update Job application" do
    visit job_application_url(@job_application)
    click_on "Edit this job application", match: :first

    fill_in "Applied at", with: @job_application.applied_at
    fill_in "Applied via", with: @job_application.applied_via
    fill_in "Company Name", with: @job_application.company_name
    fill_in "Contact email", with: @job_application.contact_email
    fill_in "Contact name", with: @job_application.contact_name
    fill_in "Position", with: @job_application.position
    fill_in "Priority", with: @job_application.priority
    fill_in "Status", with: @job_application.status
    fill_in "User", with: @job_application.user_id
    click_on "Update Job application"

    assert_text "Job application was successfully updated"
    click_on "Back"
  end

  test "should destroy Job application" do
    visit job_application_url(@job_application)
    click_on "Destroy this job application", match: :first

    assert_text "Job application was successfully destroyed"
  end
end
