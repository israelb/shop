require 'rails_helper'

describe InvoicesController do
  describe 'GET #index' do
    before { get :index }

    it 'renders the index view' do
      expect(response).to render_template(:index)
    end

    it 'responses a HTML' do
      expect(response.content_type).to eq("text/html")
    end

    it { should respond_with(200) }
  end

  describe 'POST #create' do
    context 'when variables_attributes has one variable' do
      before { post :create, format: :json, params: {
        invoice: {
          subtotal: 10, tax: 2, total: 12,
            line_items_attributes:  { id: nil, name: "MacBook Pro", qty: 1, price: 100, total: 100 }
          }
        }
      }

      it 'responses a JSON' do
        expect(response.content_type).to eq("application/json")
      end

      it { should respond_with(201) }
    end
  end

  describe 'DELETE #destroy' do
    let!(:invoice) { FactoryBot.create(:invoice) }

    it 'deletes the invoice' do
      expect{
        delete :destroy, params: { id: invoice.to_param }
      }.to change(Invoice, :count).by(-1)
    end

    it 'returns 302' do
      delete :destroy, params: { id: invoice.to_param }

      expect(response.status).to eq(302)
    end
  end
end
