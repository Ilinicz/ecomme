class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy, :decrease, :increase]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to :back, notice: "Item was added to your cart" }
        format.js   { @current_item = @line_item}
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    respond_to do |format|
      if current_cart.line_items.empty?
        format.html {redirect_to :back, notice: 'Your cart is empty'}
        format.js {@current_item = @line_item}
      else
        format.html {redirect_to :back, notice: 'Item removed!'}
        format.js {@current_item = @line_item}
      end
    end
  end

  # POST line_items/1
  def decrease
    @line_item = @cart.line_items.find_by_id(params[:id])
    @line_item = @line_item.decrease(@line_item.id)

    respond_to do |format|
      if @line_item.save
        format.html {redirect_to :back, notice: 'Quantity was successfully decreased'}
        format.js {@current_item = @line_item}
        format.json {head :ok}
      else
        format.html {redirect_to :back, notice: 'Something went wrong. Try again'}
        format.js {@current_item = @line_item}
        format.json {head :ok}
      end
    end
  end

  #POST line_items/1
  def increase
    @line_item = @cart.line_items.find_by_id(params[:id])
    @line_item = @line_item.increase(@line_item.id)

    respond_to do |format|
      if @line_item.save
        format.html {redirect_to :back, notice: 'Quantity was successfully increased'}
        format.js {@current_item = @line_item}
        format.json {head :ok}
      else
        format.html {redirect_to :back, notice: 'Something went wrong. Try again'}
        format.js {@current_item = @line_item}
        format.json {head :ok}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
