require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  describe '商品出品' do
    before do
      @exhibit = FactoryBot.build(:exhibit)
    end

      context '出品ができるとき' do
        it 'image,product_name,product_description,category_id,condition_id,shipping_charge_id,sender_id,days_to_ship_id,priceが存在すれば登録できる' do
          expect(@exhibit).to be_valid
        end
        it 'priceが半角数値なら出品ができる' do
          @exhibit.price = 1000
          expect(@exhibit).to be_valid
        end
      end

      context '出品ができないとき' do
        it 'imageが空では登録できない' do
          @exhibit.image = nil
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "画像を入力してください"
        end
        it 'product_nameが空では登録できない' do
          @exhibit.product_name = ''
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "商品名を入力してください"
        end
        it 'product_descriptionが空では登録できない' do
          @exhibit.product_description = ''
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "商品説明を入力してください"
        end
        it 'categoryが空では登録できない' do
          @exhibit.category_id = '1'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "カテゴリーを選択してください"
        end
        it 'conditionが空では登録できない' do
          @exhibit.condition_id = '1'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "商品の状態を選択してください"
        end
        it 'shipping_chargeが空では登録できない' do
          @exhibit.shipping_charge_id = '1'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "配送料の負担を選択してください"
        end
        it 'senderが空では登録できない' do
          @exhibit.sender_id = '1'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "発送元の地域を選択してください"
        end
        it 'Days_to_shipが空では登録できない' do
          @exhibit.days_to_ship_id = '1'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "発送までの日数を選択してください"
        end
        it 'priceが空では登録できない' do
          @exhibit.price = ''
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include "販売価格を入力してください", "販売価格を半角数字で入力してください", "販売価格は数値で入力してください"
        end
        it 'priceが300円以下では登録できない' do
          @exhibit.price = '100'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include '販売価格は300以上の値にしてください'
        end
        it 'priceが9_999_999円を超えると出品できない' do
          @exhibit.price = '100000000'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include '販売価格は9999999以下の値にしてください'
        end
        it 'priceが全角数値では登録できない' do
          @exhibit.price = '１000'
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include '販売価格は数値で入力してください'
        end
        it 'ユーザー情報がない場合は登録できないこと' do
          @exhibit.user = nil
          @exhibit.valid?
          expect(@exhibit.errors.full_messages).to include 'Userを入力してください'
        end
      end
  end
end
