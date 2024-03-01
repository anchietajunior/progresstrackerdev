require "test_helper"

class JobApplicationTest < ActiveSupport::TestCase
  setup do
    @user = users(:janedoe)
  end

  test "requires a position title" do
    ja = JobApplication.new(
      position: "",
      status: :applied,
      applied_at: Date.today,
      company_name: "TropicalRB",
      location: "São Paulo",
      user: @user
    )

    assert_not ja.valid?
    ja.position = "Ruby developer"
    assert ja.valid?
  end

  test "requires a status" do
    ja = JobApplication.new(
      position: "Ruby Developer",
      status: nil,
      applied_at: Date.today,
      company_name: "TropicalRB",
      location: "São Paulo",
      user: @user
    )

    assert_not ja.valid?
    ja.status = :applied
    assert ja.valid?
  end

  test "requires an applied_at date" do
    ja = JobApplication.new(
      position: "Ruby Developer",
      status: :applied,
      applied_at: nil,
      company_name: "TropicalRB",
      location: "São Paulo",
      user: @user
    )

    assert_not ja.valid?
    ja.applied_at = Date.today
    assert ja.valid?
  end

  test "requires a company name" do
    ja = JobApplication.new(
      position: "Ruby Developer",
      status: :applied,
      applied_at: Date.today,
      company_name: nil,
      location: "São Paulo",
      user: @user
    )

    assert_not ja.valid?
    ja.company_name = "TropicalRB"
    assert ja.valid?
  end

  test "requires a location" do
    ja = JobApplication.new(
      position: "Ruby Developer",
      status: :applied,
      applied_at: Date.today,
      company_name: "TropicalRB",
      location: nil,
      user: @user
    )

    assert_not ja.valid?
    ja.location = "São Paulo"
    assert ja.valid?
  end
end
