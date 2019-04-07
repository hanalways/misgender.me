class ResultsController < ApplicationController
  ADMINS = { ENV["ADMIN_USERNAME"] => ENV["ADMIN_PASSWORD"] }

  before_action :authenticate, except: [:new, :create, :show]
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @returned_value = JSON.parse(@result.returned_value, symbolize_names: true)
  end

  # GET /results/new
  def new
    @query = Query.find(params[:query_id])
    @result = @query.result ? @query.result : @query.build_result
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @query = Query.find(params[:query_id])
    @result = @query.result ? @query.result : @query.build_result(result_params.merge({ query_id: params[:query_id], returned_value: params[:returned_value] }))

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: "Result was successfully created." }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: "Result was successfully updated." }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: "Result was successfully destroyed." }
      format.json { head :no_content }
    end
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
