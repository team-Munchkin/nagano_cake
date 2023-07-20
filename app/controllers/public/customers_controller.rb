class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customers_path(current_customer)
    else
      render "edit"
      flash[:alert]
    end
  end

  def unscribe
  end

  def withdrawal
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to '/'
  end


  protected

  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,
    :first_name_kana,:post_code,:address,:phone_number,:email)
  end

  def reject_user
    @customer= Customer.find_by(params[:current_customer])
    if @customer
      if @customer.valid_password?(params[:current_customer]) && (@customer.is_deleted == false)
        flash[:notice] = "退会済みです。再度登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
end
