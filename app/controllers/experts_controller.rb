class ExpertsController < ApplicationController
  before_action :set_expert, only: %i[ show edit update destroy ]

  # GET /experts or /experts.json
  def index
    @experts = Expert.all
  end

  # GET /experts/1 or /experts/1.json
  def show
  end

  # GET /experts/new
  def new
    @expert = Expert.new
  end

  # GET /experts/1/edit
  def edit
  end

  # POST /experts or /experts.json
  def create
    @expert = Expert.new(expert_params)

    respond_to do |format|
      if @expert.save
        format.html { redirect_to expert_url(@expert), notice: "Expert was successfully created." }
        format.json { render :show, status: :created, location: @expert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experts/1 or /experts/1.json
  def update
    respond_to do |format|
      if @expert.update(expert_params)
        format.html { redirect_to expert_url(@expert), notice: "Expert was successfully updated." }
        format.json { render :show, status: :ok, location: @expert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experts/1 or /experts/1.json
  def destroy
    @expert.destroy

    respond_to do |format|
      format.html { redirect_to experts_url, notice: "Expert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expert
      @expert = Expert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expert_params
      params.require(:expert).permit(:name)
    end
end
