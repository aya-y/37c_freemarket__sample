require 'rails_helper'

describe ItemsController do
  describe 'Get #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    it 'item successfully saved' do
        item = build(:item)
        expect{item.save}.to change{Item.count}.by(1)
        expect(item.save).to be_truthy
    end

    it 'item not successfully saved' do
        item = Item.new
        expect(item.save).to be_falsey
    end
  end

  describe 'Get #show' do
    it 'assigns the requested contact to @item' do
      item = create(:item)
      get :show, params: { id: item }
      expect(assigns(:item)).to eq item
    end
    it "renders the :show template" do
      item = create(:item)
      get :show, params: { id: item }
      expect(response).to render_template :show
    end
  end

  describe 'Get #area' do
    it "render the :area template" do
      item = create(:item)
      get :area, params: { prefecture: item}
      expect(response).to render_template :area
    end
  end
end
