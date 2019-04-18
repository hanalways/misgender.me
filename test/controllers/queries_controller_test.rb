require "test_helper"

describe QueriesController do
  let(:query) { queries :one }

  it "gets index" do
    get queries_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_query_url
    value(response).must_be :success?
  end

  it "creates query" do
    expect {
      post queries_url, params: { query: { consent: query.consent } }
    }.must_change "Query.count"

    must_redirect_to query_path(Query.last)
  end

  it "gets edit" do
    get edit_query_url(query)
    value(response).must_be :success?
  end

  it "updates query" do
    patch query_url(query), params: { query: { consent: query.consent } }
    must_redirect_to query_path(query)
  end

  it "destroys query" do
    expect {
      delete query_url(query)
    }.must_change "Query.count", -1

    must_redirect_to queries_path
  end
end
