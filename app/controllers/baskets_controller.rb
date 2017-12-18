class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  # GET /baskets.json
  def index
    @baskets = Basket.all
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  # POST /baskets
  # POST /baskets.json
  def create


@basket = Basket.new
@basket = Basket.new(params.permit(:production_id, :user_id, :count))
@baskets = Basket.all
#respond_to do |format|
  #Basket.update(:user_id => @baskets[i].user_id, :production_id => @baskets[i].production_id, :count => @baskets[i].count+1)
#  format.html { redirect_to "/", notice: @baskets[0].user_id}
#end
respond_to do |format|
  if @baskets.count==0
     @basket.save
  else
    i=0
    while @baskets.count>i && (@baskets[i].user_id!=@basket.user_id || @baskets[i].production_id!=@basket.production_id)
      i+=1
    end
    if  i!=@baskets.count
      Basket.update(@baskets[i].id, :user_id => @baskets[i].user_id, :production_id => @baskets[i].production_id, :count => @baskets[i].count+1)
    else
        @basket.save
    end
  end
    format.html { redirect_to "/", notice: @baskets.count}
  end
end



  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: 'Basket was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_params
      params.require(:basket).permit(:production_id, :user_id)
    end
end
