require "test_helper"

describe ResultsController do
  let(:result) { results :one }

  it "gets index" do
    get results_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_result_url
    value(response).must_be :success?
  end

  it "creates result" do
    expect {
      post results_url, params: { result: { accurate: result.accurate, returned_result: result.returned_result } }
    }.must_change "Result.count"

    must_redirect_to result_path(Result.last)
  end

  it "shows result" do
    get result_url(result)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_result_url(result)
    value(response).must_be :success?
  end

  it "updates result" do
    patch result_url(result), params: { result: { accurate: result.accurate, returned_result: result.returned_result } }
    must_redirect_to result_path(result)
  end

  it "destroys result" do
    expect {
      delete result_url(result)
    }.must_change "Result.count", -1

    must_redirect_to results_path
  end
end
