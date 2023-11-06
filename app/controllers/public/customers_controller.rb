class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to mypage_customers_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def quit
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_furigana, :first_name_furigana, :telephone_number, :email)
  end
end
