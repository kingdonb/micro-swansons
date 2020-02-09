class TablesController < ApplicationController
  before_action :set_table, only: [
    :show, :edit, :update, :destroy,
    :sit, :eat, :clear,
  ]

  before_action :get_client_info, only: [
    :sit, :eat, :clear, :show,
    :my_left_fork, :my_right_fork,
    :left_neighbor, :right_neighbor,
  ]

  before_action :set_left_and_right, only: [
    :show, :my_left_fork, :my_right_fork,
  ]

  include ClientInfoConcern

  def sit
    @table.be_seated!(client_ip: my_client_ip)
  end

  def my_left_fork
  end

  def my_right_fork
  end

  def left_neighbor
    @table.who_is_left_of(client_ip: my_client_ip)
  end

  def right_neighbor
    @table.who_is_right_of(client_ip: my_client_ip)
  end

  def clear
    w_ip = waiter_ip
    if my_client_ip == w_ip
      @table.clear_table!
    else
      raise NotAuthorizedAsWaiter, "The waiter is at '#{w_ip}', you are not the waiter."
    end
  end

  def eat
    @table.eat!(client_ip: my_client_ip)
  end

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_left_and_right
      if @table.verify_all_seated?
        @left_fork = @table.what_fork_is_left_of(client_ip: my_client_ip)
        @right_fork = @table.what_fork_is_right_of(client_ip: my_client_ip)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :seats)
    end
end
