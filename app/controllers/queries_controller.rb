class QueriesController < ApplicationController
  ADMINS = { ENV["ADMIN_USERNAME"] => ENV["ADMIN_PASSWORD"] }

  before_action :authenticate, except: [:new, :create, :show]
  before_action :set_query, only: [:show, :edit, :update, :destroy]

  def index
    @queries = Query.all
  end

  def new
    @query = Query.new
  end

  def edit
  end

  def create
    @query = Query.new(query_params)
    if @query.save
      redirect_to new_query_result_path(@query)
    else
      render :new
    end
  end

  def update
    if @query.update(query_params)
      redirect_to @query, notice: "Query was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @query.destroy
    redirect_to queries_url, notice: "Query was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_query
    @query = Query.find(params[:id])
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      ADMINS[username]
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def query_params
    params.require(:query).permit(:username, :consent, gender_ids: [], ethnicity_ids: [])
  end
end
