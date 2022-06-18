class FreelancersController < ApplicationController
  before_action :set_freelancer, only: %i[ show edit update destroy ]

  # GET /freelancers
  def index
    @freelancers = Freelancer.all
  end

  # GET /freelancers/1
  def show
  end

  # GET /freelancers/new
  def new
    @freelancer = Freelancer.new
  end

  # GET /freelancers/1/edit
  def edit
  end

  # POST /freelancers
  def create
    @freelancer = Freelancer.new(freelancer_params)

    if @freelancer.save
      redirect_to @freelancer, notice: "Freelancer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /freelancers/1
  def update
    if @freelancer.update(freelancer_params)
      redirect_to @freelancer, notice: "Freelancer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /freelancers/1
  def destroy
    @freelancer.destroy
    redirect_to freelancers_url, notice: "Freelancer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freelancer
      @freelancer = Freelancer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def freelancer_params
      params.require(:freelancer).permit(:first_name, :last_name, :bio, :cost)
    end
end
