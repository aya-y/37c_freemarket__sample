require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
    describe 'Get #large_category' do
    it "renders the :large_category template" do
      item = build(:item)
      get :large_category, params: { large_category_id: item}
      expect(response).to render_template :large_category
    end
  end
  describe 'Get #medium_category' do
    it "renders the :medium_category template" do
      item = build(:item)
      get :medium_category, params: { large_category_id: item, medium_category_id: item}
      expect(response).to render_template :medium_category
    end
  end
  describe 'Get #small_category' do
    it "renders the :small_category template" do
      item = build(:item)
      get :small_category, params: { large_category_id: item, medium_category_id: item,small_category_id: item}
      expect(response).to render_template :small_category
    end
  end

end
