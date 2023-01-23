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
          expect(@purchase_shipping_address.errors.full_messages).to include "Token can't be blank"
        end
        it 'postal_codeが空では登録できない' do
          @purchase_shipping_address.postal_code = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Postal code can't be blank"
        end
        it 'sender_idが空では登録できない' do
          @purchase_shipping_address.sender_id = '1'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Sender can't be blank"
        end
        it 'municipalitieが空では登録できない' do
          @purchase_shipping_address.municipalitie = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Municipalitie can't be blank"
        end
        it 'addressが空では登録できない' do
          @purchase_shipping_address.address = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Address can't be blank"
        end
        it 'telephone_numberが空では登録できない' do
          @purchase_shipping_address.telephone_number = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Telephone number can't be blank"
        end
        it 'postal_codeでハイフンがない場合は登録できない' do
          @purchase_shipping_address.postal_code = '12345678'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows(123-1234)'
        end
        it 'telephone_numberで数値が9桁以下では登録できない' do
          @purchase_shipping_address.telephone_number = '12345678'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include 'Telephone number is too short'
        end
        it 'telephone_numberで数値でない場合は登録できない' do
          @purchase_shipping_address.telephone_number = 'あいうえお'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include 'Telephone number is invalid. Input only number'
        end
        it 'telephone_numberで電話番号が12桁以上の場合は登録できない' do
          @purchase_shipping_address.telephone_number = '0123456789012'
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include 'Telephone number is too short'
        end
        it 'user_idが紐付いていないと保存できない' do
          @purchase_shipping_address.user_id = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "User can't be blank"
        end
        it 'exhibit_idが紐付いていないと保存できない' do
          @purchase_shipping_address.exhibit_id = nil
          @purchase_shipping_address.valid?
          expect(@purchase_shipping_address.errors.full_messages).to include "Exhibit can't be blank"
        end
      end
  end
end
