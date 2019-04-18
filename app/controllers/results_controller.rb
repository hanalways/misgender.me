class ResultsController < ApplicationController
  ADMINS = { ENV["ADMIN_USERNAME"] => ENV["ADMIN_PASSWORD"] }

  before_action :authenticate, except: [:new, :create, :show]
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  def index
    @results = Result.all
  end

  def show
    @result = Result.find(params[:id])
    @result_data = JSON.parse(@result.returned_value)
  end

  def new
    @query = Query.find(params[:query_id])
    @returned_value = GenderMe.new(@query.username).result
    @result = Result.new
  end

  def edit
  end

  def create
    @query = Query.find(params[:query_id])
    @result = Result.new result_params

    if @result.save
      redirect_to @result, notice: "Your result was added to our database. Thank you for your feedback!"
    else
      render :new
    end
  end

  def update
    if @result.update(result_params)
      redirect_to @result, notice: "Result was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @result.destroy
    redirect_to results_url, notice: "Result was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_result
    @result = Result.find(params[:id])
    @query = Query.find(@result.query_id)
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      ADMINS[username]
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def result_params
    params.require(:result).permit(:accurate, :returned_value, :query_id)
  end
end
