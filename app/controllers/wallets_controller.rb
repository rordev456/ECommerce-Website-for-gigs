class WalletsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index
    @user = current_user
    @wallets = current_user.wallets
  end

  def new
    @wallet = @user.wallets.new
  end

  def create
    @wallet = Wallet.new(wallet_param)
    @user = params[:user_id]
    @wallet.user_id = @user
    @wallet.cardnumber = params[:wallet][:cardnumber].delete(' ')
    if @wallet.save
      redirect_to user_wallets_path
    else
      render :new
    end
  end

  private
    def wallet_param
      params.require(:wallet).permit(:cardowner, :cardnumber, :expiredate)
    end
    def set_user
      @user = current_user
    end

end