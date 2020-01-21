class ForksController < ApplicationController
  before_action :set_fork, only: [:show, :edit, :update, :destroy]

  # GET /forks
  # GET /forks.json
  def index
    @forks = Fork.all
  end

  # GET /forks/1
  # GET /forks/1.json
  def show
  end

  # GET /forks/new
  def new
    @fork = Fork.new
  end

  # GET /forks/1/edit
  def edit
  end

  # POST /forks
  # POST /forks.json
  def create
    @fork = Fork.new(fork_params)

    respond_to do |format|
      if @fork.save
        format.html { redirect_to @fork, notice: 'Fork was successfully created.' }
        format.json { render :show, status: :created, location: @fork }
      else
        format.html { render :new }
        format.json { render json: @fork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forks/1
  # PATCH/PUT /forks/1.json
  def update
    respond_to do |format|
      if @fork.update(fork_params)
        format.html { redirect_to @fork, notice: 'Fork was successfully updated.' }
        format.json { render :show, status: :ok, location: @fork }
      else
        format.html { render :edit }
        format.json { render json: @fork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forks/1
  # DELETE /forks/1.json
  def destroy
    @fork.destroy
    respond_to do |format|
      format.html { redirect_to forks_url, notice: 'Fork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fork
      @fork = Fork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fork_params
      params.require(:fork).permit(:position, :clean, :table_id)
    end
end
