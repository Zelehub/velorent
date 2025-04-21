class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @user = current_user
    @order = Order.new(order_params)
    @order.user = @user
    @order.bike = @bike
    @order.status = "created"

    if @order.save
      redirect_to checkout_path(@order)
    else
      # flash[:notice] = "Please select a valid date"
      render "bikes/show", status: :unprocessable_entity
    end
    # raise
  end

  def set_pending
    @order = Order.find(params[:id])
    @order.status = "pending"
    @order.save!
    redirect_to orders_path
  end

  def set_confirmed
    @order = Order.find(params[:id])
    @order.status = "confirmed"
    @order.save!
    redirect_to my_bikes_path
  end

  def set_rejected
    @order = Order.find(params[:id])
    @order.status = "rejected"
    @order.save!
    redirect_to my_bikes_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:rental_date, :rental_date_end)
  end
end
