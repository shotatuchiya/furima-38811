require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  before do
    @exhibit = FactoryBot.build(:exhibit)
  end

  describe '商品出品' do
    context '出品ができるとき' do
      it 'image,product_name,product_description,category_id,condition_id,shipping_charge_id,sender_id,days_to_ship_id,priceが存在すれば登録できる' do
        expect(@exhibit).to be_valid
      end
      it 'product_nameが40字以内なら出品ができる' do
        expect(@exhibit).to be_valid
      end
      it 'product_descriptionが1000字以内なら出品ができる' do
        expect(@exhibit).to be_valid
      end
      it 'priceが300円以上かつ9999999円以内なら出品ができる' do
        expect(@exhibit).to be_valid
      end
      it 'priceが半角数値なら出品ができる' do
        expect(@exhibit).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'imageが空では登録できない' do
        @exhibit.image = nil
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Image can't be blank"
      end
      it 'product_nameが空では登録できない' do
        @exhibit.product_name = ''
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Product name can't be blank"
      end
      it 'product_descriptionが空では登録できない' do
        @exhibit.product_description = ''
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Product description can't be blank"
      end
      it 'categoryが空では登録できない' do
        @exhibit.category_id = '1'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Category can't be blank"
      end
      it 'conditionが空では登録できない' do
        @exhibit.condition_id = '1'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_chargeが空では登録できない' do
        @exhibit.shipping_charge_id = '1'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Shipping charge can't be blank"
      end
      it 'senderが空では登録できない' do
        @exhibit.sender_id = '1'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Sender can't be blank"
      end
      it 'Days_to_shipが空では登録できない' do
        @exhibit.days_to_ship_id = '1'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'priceが空では登録できない' do
        @exhibit.price = ''
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円以下では登録できない' do
        @exhibit.price = '100'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが300円以下では登録できない' do
        @exhibit.price = '100000000'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceが全角数値では登録できない' do
        @exhibit.price = '１000'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end