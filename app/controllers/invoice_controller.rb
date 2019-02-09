class InvoiceController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.json { render :show, status: :created, location: @invoice }
      else
        format.json { render json: @invoice.errors, status: :unprocesasble_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.save
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.json { render json: @invoice.errors, status: :unprocesasble_entity }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_invoice
    byebug
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice)
      .permit(:subtotal, :tax, :total, line_items_attributes: [:id, :name, :qty, :price, :total, :_destroy])
  end
end
