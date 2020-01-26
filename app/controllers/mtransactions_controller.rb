# typed: true
class MtransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @mtransactions = Mtransaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @mtransaction = Mtransaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @mtransaction = Mtransaction.new(transaction_params)

    respond_to do |format|
      if @mtransaction.save
        format.html { redirect_to @mtransaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @mtransaction }
      else
        format.html { render :new }
        format.json { render json: @mtransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @mtransaction.update(transaction_params)
        format.html { redirect_to @mtransaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @mtransaction }
      else
        format.html { render :edit }
        format.json { render json: @mtransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @mtransaction.destroy
    respond_to do |format|
      format.html { redirect_to mmtransactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @mtransaction = Mtransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.fetch(:mtransaction, {})
    end
end
