require "test_helper"

describe GendersController do
  let(:gender) { genders :one }

  it "gets index" do
    get genders_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_gender_url
    value(response).must_be :success?
  end

  it "creates gender" do
    expect {
      post genders_url, params: { gender: { name: gender.name } }
    }.must_change "Gender.count"

    must_redirect_to gender_path(Gender.last)
  end

  it "shows gender" do
    get gender_url(gender)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_gender_url(gender)
    value(response).must_be :success?
  end

  it "updates gender" do
    patch gender_url(gender), params: { gender: { name: gender.name } }
    must_redirect_to gender_path(gender)
  end

  it "destroys gender" do
    expect {
      delete gender_url(gender)
    }.must_change "Gender.count", -1

    must_redirect_to genders_path
  end
end
