require 'rails_helper'

describe User do 
  describe '#create' do 

    it "nicknameが無い場合は登録できないこと" do 
      user = build(:user,nickname:nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "メールアドレスが存在しなければ登録できないこと" do 
      user = build(:user,email:nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが無い場合は登録できないこと" do 
      user = build(:user,password:nil)
      user.valid? 
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "nicknameが7文字以上であれば登録できないこと" do 
      user = build(:user,nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

    it "nicknameが6文字以下では登録できること" do 
      user = build(:user,nickname: "aaaaaa")
      expect(user).to be_valid
    end

    it "passwordが6文字以上であれば登録できること" do 
      user = build(:user,password:"000000",password_confirmation:"000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do 
      user = build(:user,password:"00000",password_confirmation:"00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "nickname,email,passwordとpassword_confirmationが存在すれば登録できること" do 
      user = build(:user)
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できないこと" do 
      #仮でユーザーを登録
      user = create(:user)
      #上記で登録したユーザーと同じemailの値を持つユーザーを作成
      another_user = build(:user)
      another_user.valid? 
      expect(another_user.errors[:email]).to include("has already been taken")
    end

  end
end
