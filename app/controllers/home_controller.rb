class HomeController < ApplicationController
  before_action :set_freelancer, only: %i[ show edit update destroy ]



  def index
    freelancers = Rails.cache.fetch('freelancers', expires_in: 24.hours) do
      Freelancer.order(featured: :desc).map(&:attributes)
    end
  
    freelancers = freelancers.select do |freelancer|
      freelancer['cost'].in?((params[:cost_lower_than].to_i || 0)..params[:cost_greater_than].presence)
    end
  
    @pagy, @freelancers = pagy_array(freelancers)
  end
  

  private

  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end
end
