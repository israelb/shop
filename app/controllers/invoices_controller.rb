class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice)
        send_data pdf.render,
          filename: "invoice.pdf",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end

  def new
    @invoice = Invoice.new
  end

  def create
    byebug
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.json { render json: @invoice, status: :created }
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
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice)
      .permit(:subtotal, :tax, :total, line_items_attributes: [:id, :name, :qty, :price, :total, :_destroy])
  end
end
