class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]

  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all
    @users = User.all
    @carts = Cart.all
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || !current_user.role?
    @production = Production.new
    @authors = Author.all
  end

  # GET /productions/1/edit
  def edit
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || !current_user.role?
    @authors = Author.all
  end

  # POST /productions
  # POST /productions.json
  def create
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || !current_user.role?
    @production = Production.new(production_params)

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: 'Production was successfully created.' }
        format.json { render :show, status: :created, location: @production }
      else
        format.html { render :new }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || !current_user.role?
    respond_to do |format|
      if @production.update(production_params)
        format.html { redirect_to @production, notice: 'Production was successfully updated.' }
        format.json { render :show, status: :ok, location: @production }
      else
        format.html { render :edit }
        format.json { render json: @production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || !current_user.role?
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: 'Production was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_params
      params.require(:production).permit(:title, :price, :author_id, :count, :pages)
    end
end
