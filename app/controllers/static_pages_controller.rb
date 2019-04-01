class StaticPagesController < ApplicationController
  def home
  end

  def new
  end

  def create
  end

  def results
  end

  def query_params
    params.require(:query).permit(:consent, :username, gender_ids: [], ethnicity_ids: [])
  end
end
