class HomeController < ApplicationController
  before_action :set_freelancer, only: %i[ show edit update destroy ]


  def index
    @freelancers = Freelancer.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end
end
