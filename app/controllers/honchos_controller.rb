class HonchosController < ApplicationController
  before_action :set_honcho, only: [:show, :edit, :update, :destroy]

  # GET /honchos
  # GET /honchos.json
  def index
    @honchos = Honcho.all
  end

  # GET /honchos/1
  # GET /honchos/1.json
  def show
  end

  # GET /honchos/new
  def new
    @honcho = Honcho.new
  end

  # GET /honchos/1/edit
  def edit
  end

  # POST /honchos
  # POST /honchos.json
  def create
    @honcho = Honcho.new(honcho_params)

    respond_to do |format|
      if @honcho.save
        format.html { redirect_to current_user, notice: 'Honcho was successfully created.' }
        format.json { render :show, status: :created, location: @honcho }
      else
        format.html { render :new }
        format.json { render json: @honcho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /honchos/1
  # PATCH/PUT /honchos/1.json
  def update
    respond_to do |format|
      if @honcho.update(honcho_params)
        format.html { redirect_to current_user, notice: 'Honcho was successfully updated.' }
        format.json { render :show, status: :ok, location: @honcho }
      else
        format.html { render :edit }
        format.json { render json: @honcho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /honchos/1
  # DELETE /honchos/1.json
  def destroy
    @honcho.destroy
    respond_to do |format|
      format.html { redirect_to honchos_url, notice: 'Honcho was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_honcho
      @honcho = Honcho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def honcho_params
      params.require(:honcho).permit(:name, :position, :phone_number, :email, :notes, :links, :company_id)
    end
end
