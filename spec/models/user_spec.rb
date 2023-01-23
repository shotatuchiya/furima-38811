require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

      context '新規登録できるとき' do
        it 'nickname,email,passwordとpassword_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'emailが重複しない場合は登録できる' do
          expect(@user).to be_valid
        end
        it 'emailに@を含んだ場合は登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordに英字と数字を含んだ場合は登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが半角文字の場合は登録できる' do
          expect(@user).to be_valid
        end
        it 'first_name,last_nameが全角の場合は登録できる' do
          expect(@user).to be_valid
        end
        it 'first_name_kana,last_name_kanaがカナの場合は登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nameが空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Name can't be blank"
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end
        it 'passwordが6文字以下であれば登録できない' do
          @user.password = '111aa'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
        end
        it 'passwordが英字のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
        end
        it 'passwordが数字のみでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
        end
        it 'passwordが全角文字を含んでは登録できない' do
          @user.password = 'ｚzz111'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end
        it 'first_nameが全角でないと登録できない' do
          @user.first_name = 'ｱｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include 'First name Input full-width characters'
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank"
        end
        it 'last_nameが全角でないと登録できない' do
          @user.last_name = 'ｱｱ'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Last name Input full-width characters'
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end
        it 'first_name_kanaがカナでないと登録できない' do
          @user.first_name_kana = 'かた'
          @user.valid?
          expect(@user.errors.full_messages).to include 'First name kana Input full-width katakana characters'
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name kana can't be blank"
        end
        it 'last_name_kanaがカナでないと登録できない' do
          @user.last_name_kana = 'かな'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Last name kana Input full-width katakana characters'
        end
        it 'birthdayが空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Birthday can't be blank"
        end
      end
  end
end
