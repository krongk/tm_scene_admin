class PaymentTokensController < ApplicationController
  before_action :set_payment_token, only: [:show, :edit, :update, :destroy]

  # GET /payment_tokens
  # GET /payment_tokens.json
  def index
    @payment_tokens = PaymentToken.all
  end

  # GET /payment_tokens/1
  # GET /payment_tokens/1.json
  def show
  end

  # GET /payment_tokens/new
  def new
    @payment_token = PaymentToken.new
  end

  # GET /payment_tokens/1/edit
  def edit
  end

  # POST /payment_tokens
  # POST /payment_tokens.json
  def create
    @payment_token = PaymentToken.new(payment_token_params)

    respond_to do |format|
      if @payment_token.save
        format.html { redirect_to @payment_token, notice: 'Payment token was successfully created.' }
        format.json { render :show, status: :created, location: @payment_token }
      else
        format.html { render :new }
        format.json { render json: @payment_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_tokens/1
  # PATCH/PUT /payment_tokens/1.json
  def update
    respond_to do |format|
      if @payment_token.update(payment_token_params)
        format.html { redirect_to @payment_token, notice: 'Payment token was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_token }
      else
        format.html { render :edit }
        format.json { render json: @payment_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_tokens/1
  # DELETE /payment_tokens/1.json
  def destroy
    @payment_token.destroy
    respond_to do |format|
      format.html { redirect_to payment_tokens_url, notice: 'Payment token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_token
      @payment_token = PaymentToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_token_params
      params.require(:payment_token).permit(:user_id, :code, :status, :note, :actived_by, :actived_site_id)
    end
end
