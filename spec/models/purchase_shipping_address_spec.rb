require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      exhibit = FactoryBot.create(:exhibit)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, exhibit_id: exhibit.id)
      sleep 0.5
    end
    
      context '購入ができるとき' do
        it 'token,postal_code,sender_id,municipalitie,address,telephone_numberが存在すれば購入できる' do
          expect(@purchase_shipping_address).to be_valid
        end
        it 'building_nameがからでも購入できる' do
          @purchase_shipping_address.building_name = nil
          expect(@purchase_shipping_address).to be_valid
        end
      end

      context '購入ができないとき' do
        it 'tokenが空では登録できない' do
          @purchase_shipping_address.token = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "クレジットカード情報を入力してください"
        end
        it 'postal_codeが空では登録できない' do
          @purchase_shipping_address.postal_code = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "郵便番号を入力してください", "郵便番号を次のように入力します(123-1234)"
        end
        it 'sender_idが空では登録できない' do
          @purchase_shipping_address.sender_id = '1'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "発送元の地域を選択してください"
        end
        it 'municipalitieが空では登録できない' do
          @purchase_shipping_address.municipalitie = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "市区町村を入力してください"
        end
        it 'addressが空では登録できない' do
          @purchase_shipping_address.address = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "番地を入力してください"
        end
        it 'telephone_numberが空では登録できない' do
          @purchase_shipping_address.telephone_number = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "電話番号が短すぎます", "電話番号を半角数字で入力してください"
        end
        it 'postal_codeでハイフンがない場合は登録できない' do
          @purchase_shipping_address.postal_code = '12345678'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include '郵便番号を次のように入力します(123-1234)'
        end
        it 'telephone_numberで数値が9桁以下では登録できない' do
          @purchase_shipping_address.telephone_number = '12345678'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include '電話番号が短すぎます'
        end
        it 'telephone_numberで数値でない場合は登録できない' do
          @purchase_shipping_address.telephone_number = 'あいうえお'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "電話番号が短すぎます", "電話番号を半角数字で入力してください"
        end
        it 'telephone_numberで電話番号が12桁以上の場合は登録できない' do
          @purchase_shipping_address.telephone_number = '0123456789012'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include '電話番号が短すぎます'
        end
        it 'user_idが紐付いていないと保存できない' do
          @purchase_shipping_address.user_id = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Userを入力してください"
        end
        it 'exhibit_idが紐付いていないと保存できない' do
          @purchase_shipping_address.exhibit_id = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Exhibitを入力してください"
        end
      end
  end
end
