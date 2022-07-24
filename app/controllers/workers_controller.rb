class WorkersController < ApplicationController
  before_action :set_worker, only: %i[ show edit update destroy ]

  # GET /workers or /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1 or /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers or /workers.json
  def create
    @worker = Worker.new(worker_params)

    if @worker.save
      flash.now[:success] = 'Worker created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workers/1 or /workers/1.json
  def update
    if @worker.update(worker_params)
      redirect_to worker_path
    else
      render :edit
    end
  end

  # DELETE /workers/1 or /workers/1.json
  def destroy
    @worker.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:success] = 'Worker deleted!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worker_params
      params.require(:worker).permit(:name)
    end
end
