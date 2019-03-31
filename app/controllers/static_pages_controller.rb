class StaticPagesController < ApplicationController
  def home
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)
    respond_to do |format|
      if @query.save
        format.html { render :results }
        format.json { render :results, status: :created, location: @query }
      end
    else
      format.html { render :new }
      format.json { render json: @query.errors, status: :unprocessable_entity }
    end
  end

  def results
  end

  def query_params
    params.require(:query).permit(:consent, :username, gender_ids: [], ethnicity_ids: [])
  end
end
