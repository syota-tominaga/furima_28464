require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "ユーザー登録できる時" do
      it "ニックネーム、email、パスワード、本人確認、誕生日、全て入力されている時" do
        expect(@user).to be_valid
      end
      it "passwordは6文字以上、英数字混合で登録できる" do
        @user.password = "a0a0a0a0"
        @user.password_confirmation = "a0a0a0a0"
        expect(@user).to be_valid
      end
      it "メールアドレスは重複していなければ登録できる" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = "aaa@com"
        expect(another_user).to be_valid
      end
      it "メールアドレスは@を含めば登録できる" do
        @user.email = "ggg@com"
        expect(@user).to be_valid
      end
      it "ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）で入力で保存できる" do
        @user.family_name = "佐藤"
        expect(@user).to be_valid
      end
      it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力で保存できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "ユーザー本名の名字のフリガナは全角（カタカナ）で入力すると保存できる" do
        @user.family_name_kana = "サトウ"
        expect(@user).to be_valid
      end
      it "ユーザー本名の名前のフリガナは全角（カタカナ）で入力すると保存できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end


    end
    context "ユーザー登録出来ない時" do
      it "ニックネームが必須である" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが必須である" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性である" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは@を含む必要がある" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが必須である"do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは6文字以上であること" do
        @user.password = "00000"
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字混合である" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password confirmation doesn't match Password")
      end
      it "パスワードは確認ようを含めて2回入力すること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名の名字が必須である" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名の名前が必須である" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）で入力させる" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
      it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力させる" do
        @user.first_name = "uuu"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "ユーザー本名のフリガナの、名字が必須である" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "ユーザー本名のフリガナの、名前が必須である"do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー本名の名字のフリガナは全角（カタカナ）で入力させる" do
        @user.family_name_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
      end
      it "ユーザー本名の名前のフリガナは全角（カタカナ）で入力させる" do
        @user.first_name_kana = "ううう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "生年月日が必須である" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end