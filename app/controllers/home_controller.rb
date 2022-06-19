class HomeController < ApplicationController
  before_action :set_freelancer, only: %i[ show edit update destroy ]



  def index
    freelancers = Rails.cache.fetch('freelancers', expires_in: 24.hours) do
      Freelancer.order(featured: :desc).map(&:attributes)
    end
  
    if params[:cost_lower_than].present? || params[:cost_greater_than].present?
      from = params[:cost_lower_than].to_i || 0
      to = params[:cost_greater_than].to_i.zero? ? nil : params[:cost_greater_than].to_i
      freelancers = freelancers.select do |freelancer|
        freelancer['cost'].in?(from..to) 
      end
    end
  
    @pagy, @freelancers = pagy_array(freelancers)
  end
  
  

  private

  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end
end
