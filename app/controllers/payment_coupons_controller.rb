class PaymentCouponsController < ApplicationController
  before_action :set_payment_coupon, only: [:show, :edit, :update, :destroy]

  # GET /payment_coupons
  # GET /payment_coupons.json
  def index
    @payment_coupons = PaymentCoupon.all
  end

  # GET /payment_coupons/1
  # GET /payment_coupons/1.json
  def show
  end

  # GET /payment_coupons/new
  def new
    @payment_coupon = PaymentCoupon.new
  end

  # GET /payment_coupons/1/edit
  def edit
  end

  # POST /payment_coupons
  # POST /payment_coupons.json
  def create
    @payment_coupon = PaymentCoupon.new(payment_coupon_params)

    respond_to do |format|
      if @payment_coupon.save
        format.html { redirect_to @payment_coupon, notice: 'Payment coupon was successfully created.' }
        format.json { render :show, status: :created, location: @payment_coupon }
      else
        format.html { render :new }
        format.json { render json: @payment_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_coupons/1
  # PATCH/PUT /payment_coupons/1.json
  def update
    respond_to do |format|
      if @payment_coupon.update(payment_coupon_params)
        format.html { redirect_to @payment_coupon, notice: 'Payment coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_coupon }
      else
        format.html { render :edit }
        format.json { render json: @payment_coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_coupons/1
  # DELETE /payment_coupons/1.json
  def destroy
    @payment_coupon.destroy
    respond_to do |format|
      format.html { redirect_to payment_coupons_url, notice: 'Payment coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_coupon
      @payment_coupon = PaymentCoupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_coupon_params
      params.require(:payment_coupon).permit(:user_id, :code, :price, :message, :status, :actived_by, :actived_site_id, :note)
    end
end
