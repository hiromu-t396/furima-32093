require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、lastname、firstname、lastname_kana、firstname_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = '@'
        expect(@user).to be_valid
      end
      it 'passwordが英数字6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it "lastnameが/\A[ぁ-んァ-ン一-龥]\z/であれば保存できる" do
        @user.lastname = '木村'
        expect(@user).to be_valid
      end
      it "firstnameが/\A[ぁ-んァ-ン一-龥]\z/であれば保存できる" do
        @user.firstname = '拓也'
        expect(@user).to be_valid
      end
      it "lastname_kanaが/\A[ァ-ン]\z/であれば保存できる" do
        @user.lastname_kana = 'キムラ'
        expect(@user).to be_valid
      end
      it "firstname_kanaが/\A[ァ-ン]\z/であれば保存できる" do
        @user.lastname_kana = 'タクヤ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it 'password:半角英数混合(数字のみ)' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "lastnameが/\A[ぁ-んァ-ン一-龥]\z/以外だと登録できない" do
        @user.lastname = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname hane to include Japanese')
      end
      it "firstnameが/\A[ぁ-んァ-ン一-龥]\z/以外だと登録できない" do
        @user.lastname = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname hane to include Japanese')
      end
      it "lastname_kanaが/\A[ァ-ン]\z/以外だと登録できない" do
        @user.lastname = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname hane to include Katakana')
      end
      it "lastname_kanaが/\A[ァ-ン]\z/以外だと登録できない" do
        @user.firstname = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname hane to include Katakana')
      end
    end
  end
end
