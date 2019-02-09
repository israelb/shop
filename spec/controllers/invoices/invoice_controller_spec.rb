require 'rails_helper'

describe InvoicesController do
  describe 'GET #index' do
    before { get :index }

    it 'renders the index view' do
      expect(response).to render_template(:index)
    end
    it { should respond_with(200) }
  end
end
