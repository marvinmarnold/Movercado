class StockTransactionsController < ApplicationController
  # GET /stock_transactions
  # GET /stock_transactions.json
  def index
    if params.has_key?(:warehouse_select) &&  !params[:warehouse_select][:warehouse].empty?
      @warehouse = params[:warehouse_select][:warehouse]
      @stock_transactions = StockTransaction.where(:warehouse => @warehouse)
    else
      @stock_transactions = StockTransaction.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_transactions }
    end
  end

  # GET /stock_transactions/1
  # GET /stock_transactions/1.json
  def show
    @stock_transaction = StockTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock_transaction }
    end
  end

  # GET /stock_transactions/new
  # GET /stock_transactions/new.json
  def new
    @stock_transaction = StockTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock_transaction }
    end
  end

  # GET /stock_transactions/1/edit
  def edit
    @stock_transaction = StockTransaction.find(params[:id])
  end

  # POST /stock_transactions
  # POST /stock_transactions.json
  def create
    @stock_transaction = StockTransaction.new(params[:stock_transaction])

    respond_to do |format|
      if @stock_transaction.save
        format.html { redirect_to stock_transactions_path, notice: 'Stock transaction was successfully created.' }
        format.json { render json: @stock_transaction, status: :created, location: @stock_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @stock_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stock_transactions/1
  # PUT /stock_transactions/1.json
  def update
    @stock_transaction = StockTransaction.find(params[:id])

    respond_to do |format|
      if @stock_transaction.update_attributes(params[:stock_transaction])
        format.html { redirect_to stock_transactions_path, notice: 'Stock transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_transactions/1
  # DELETE /stock_transactions/1.json
  def destroy
    @stock_transaction = StockTransaction.find(params[:id])
    @stock_transaction.destroy

    respond_to do |format|
      format.html { redirect_to stock_transactions_url }
      format.json { head :no_content }
    end
  end
  
  def warehouse_summary

  end
end
