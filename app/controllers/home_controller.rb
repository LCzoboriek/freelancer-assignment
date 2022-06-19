class HomeController < ApplicationController
  before_action :set_freelancer, only: %i[ show edit update destroy ]



  def index
    freelancers_scope = Freelancer.order(featured: :desc)
    freelancers_scope = freelancers_scope.where("cost >= ?", params[:cost_lower_than]) if params[:cost_greater_than].present?
    freelancers_scope = freelancers_scope.where("cost <= ?", params[:cost_greater_than]) if params[:cost_lower_than].present?

    @pagy, @freelancers = pagy(freelancers_scope)
  end

  private

  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end
end
