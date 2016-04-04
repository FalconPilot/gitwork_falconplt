class LivresController < ApplicationController
  before_action :set_livre, only: [:show, :edit, :update, :destroy]

  # GET /livres
  # GET /livres.json
  def index
    @livres = Livre.all
    new
  end

  # GET /livres/1
  # GET /livres/1.json
  def show
  end

  # GET /livres/new
  def new
    @livre = Livre.new
  end

  # GET /livres/1/edit
  def edit
  end

  def json_return
    Livre.new(livre_params)
  end

  # POST /livres
  # POST /livres.json
  def create
    @livre = Livre.new(livre_params)

    respond_to do |format|
      if @livre.save
        format.html { redirect_to root_path, notice: 'Livre was successfully created.' }
        format.json { render :show, status: :created, location: @livre }
      else
        format.html { render :new }
        format.json { render json: @livre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livres/1
  # PATCH/PUT /livres/1.json
  def update
    respond_to do |format|
      if @livre.update(livre_params)
        format.html { redirect_to root_path, notice: 'Livre was successfully updated.' }
        format.json { render :show, status: :ok, location: @livre }
      else
        format.html { render :edit }
        format.json { render json: @livre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livres/1
  # DELETE /livres/1.json
  def destroy
    @livre.destroy
    respond_to do |format|
      format.html { redirect_to livres_url, notice: 'Livre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livre
      @livre = Livre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def livre_params
      params.require(:livre).permit(:msg, :username)
    end
end
