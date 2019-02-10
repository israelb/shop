class InvoicePdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(invoice)
    super(top_margin: 50)
    @invoice = invoice
    invoice_number
    table line_items
    move_down 20
    table info_invoice
  end

  def invoice_number
    text "Invoice \##{@invoice.id}", size: 30, style: :bold
  end

  def info_invoice
    [["Subtotal:", number_to_currency(@invoice.subtotal)],
    ["Tax: (5%)", number_to_currency(@invoice.tax)],
    ["Total:", number_to_currency(@invoice.total)]]
	end

  def line_items
    [["name","qty", "price", "total"]] +
     @invoice.line_items.map do |item|
        [item.name, item.qty, number_to_currency(item.price), number_to_currency(item.total)]
     end
  end
end
