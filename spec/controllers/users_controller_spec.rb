require 'rails_helper'
describe UsersController do
  describe 'Get #show' do
    it "renders the :show template" do
      user = build(:user)
      item = build(:item)
      get :show, params: { id: user}
      expect(response).to render_template :show
    end
  end
end
