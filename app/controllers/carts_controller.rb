class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @user=current_user
    @carts = Cart.where(user: @user)
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
      redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
  end

  # GET /carts/new
  def new
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
  end

  # POST /carts
  # POST /carts.json
  def create
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @cart = Cart.new()
    @cart = Cart.new(params.permit(:production_id, :user_id, :count, :sum))
    @carts = Cart.all
    respond_to do |format|
      if @carts.count==0
        @cart.save
        Cart.update(@cart.id, :user_id => @cart.user_id, :production_id => @cart.production_id, :sum =>@cart.production.price)
      else
        i=0
        while @carts.count>i && (@carts[i].user_id!=@cart.user_id || @carts[i].production_id!=@cart.production_id)
          i+=1
        end
        if  i!=@carts.count
          Cart.update(@carts[i].id, :user_id => @carts[i].user_id, :production_id => @carts[i].production_id, :count => @carts[i].count+1, :sum =>(@carts[i].count+1)*@carts[i].production.price)
        else
         @cart.save
        Cart.update(@cart.id, :user_id => @cart.user_id, :production_id => @cart.production_id, :sum =>@cart.production.price)
       end
     end
     format.html { redirect_to "/", notice: "The book has been successfully added"}
   end
 end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    respond_to do |format|
      if @cart.update(cart_params) && @cart.production.count!=nil && @cart.production.count>@cart.count
        @history = History.new()
        @history.production=@cart.production
        @history.user=@cart.user
        @history.count=@cart.count
        @history.sum=@cart.count*@cart.production.price
        @history.save
        @cart.destroy
        format.html { redirect_to "/histories", notice: "Thank you for your purchase" }
      else
        format.html { redirect_to "/carts", notice: "The quantity of the book exceeds quantity at the warehouse" }
        format.html { render :edit}
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
      redirect_to "/", notice: "Sorry, You don't have enough rights" if current_user.nil? || current_user.role?
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:production_id, :user_id, :count, :sum)
    end
end
