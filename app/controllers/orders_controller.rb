class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :find_all_orders, except: [:index]
  before_action :find_order, except: %i[new create index]

  # GET /orders or /orders.json
  def index
    @orders = Order.search(params)

    case params[:filter]
    when 'client_name'
      @orders = Order.filter_by_client_name
    when 'desc'
      @orders = Order.filter_by_desc
    when 'asc'
      @orders = Order.filter_by_asc
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      flash.now[:success] = 'Order created!'

      flash.now[:notice] = "Order was successfully created."
      render turbo_stream: [
        turbo_stream.append("orders", @order),
        turbo_stream.replace(
          "form_order",
          partial: "form",
          locals: { order: Order.new }
        ),
        turbo_stream.replace("notice", partial: "shared/flash")
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    if @order.update(order_params)
      flash.now[:notice] = "Order was successfully updated."
      render turbo_stream: [
        turbo_stream.replace(@order, @order),
        turbo_stream.replace("notice", partial: "shared/flash")
      ]
    else
      render :edit
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    flash.now[:notice] = "Order was successfully destroyed."
    render turbo_stream: [
      turbo_stream.remove(@order),
      turbo_stream.replace("notice", partial: "shared/flash")
    ]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def find_all_orders
    @orders = Order.all
  end

  def find_order
    @order = Order.find(params.require(:id))
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:client_name, :order_number, :client_phone, :worker_id, job_ids: [])
  end
end
