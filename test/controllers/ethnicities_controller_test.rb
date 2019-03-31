require "test_helper"

describe EthnicitiesController do
  let(:ethnicity) { ethnicities :one }

  it "gets index" do
    get ethnicities_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_ethnicity_url
    value(response).must_be :success?
  end

  it "creates ethnicity" do
    expect {
      post ethnicities_url, params: { ethnicity: { name: ethnicity.name } }
    }.must_change "Ethnicity.count"

    must_redirect_to ethnicity_path(Ethnicity.last)
  end

  it "shows ethnicity" do
    get ethnicity_url(ethnicity)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_ethnicity_url(ethnicity)
    value(response).must_be :success?
  end

  it "updates ethnicity" do
    patch ethnicity_url(ethnicity), params: { ethnicity: { name: ethnicity.name } }
    must_redirect_to ethnicity_path(ethnicity)
  end

  it "destroys ethnicity" do
    expect {
      delete ethnicity_url(ethnicity)
    }.must_change "Ethnicity.count", -1

    must_redirect_to ethnicities_path
  end
end
