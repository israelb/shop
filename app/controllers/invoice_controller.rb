class InvoiceController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def new
  end
end
