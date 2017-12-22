class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @histories = History.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
  end

  # GET /histories/new
  def new
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
  end

  # POST /histories
  # POST /histories.json
  def create
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:history).permit(:production_id, :user_id, :count, :sum)
    end
end
