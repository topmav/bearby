class PagesController < ApplicationController
    def index
    end

  def privacy_policy
  end

  def terms_of_use
  end

  def do_not_sell
    @do_not_sell = DoNotSell.new
  end

  def create_do_not_sell
    @do_not_sell = DoNotSell.new(do_not_sell_params)
    
    if @do_not_sell.save
      flash[:success] = "Your request has been submitted successfully."
      redirect_to do_not_sell_path
    else
      render :do_not_sell, status: :unprocessable_entity
    end
  end

  private

  def do_not_sell_params
    params.require(:do_not_sell).permit(:first_name, :last_name, :email, :phone)
  end
end