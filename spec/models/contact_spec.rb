require 'rails_helper'

describe Contact do
  # 名前,メールアドレス,内容があれば有効な状態であること
  it "is valid with name,email and content" do
    contact=Contact.new(name:'竹村',email:'example@ex.com',content:'お問い合わせ')
    expect(contact).to be_valid
  end

  #名前がなければ無効であること
  it "is invalid without a name" do
    contact=Contact.new(email:'example@ex.com',content:'お問い合わせ')
    expect(contact).not_to be_valid
  end

  #メールアドレスがなければ無効であること
  it "is invalid without a email" do
    contact=Contact.new(name:'竹村',content:'お問い合わせ')
    expect(contact).not_to be_valid
  end

  #内容がなければ無効であること
  it "is invalid without a content" do
    contact=Contact.new(name:'竹村',email:'example@ex.com')
    expect(contact).not_to be_valid
  end

  #名前がなければエラーメッセージが発生すること
  it "produces error message without name" do
    contact=Contact.new(email:'example@ex.com',content:'お問い合わせ')
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
  end

  #メールアドレスがなければエラーメッセージが発生すること
  it "produces error message without email" do
    contact=Contact.new(name:'竹村',content:'お問い合わせ')
    contact.valid?
    expect(contact.errors[:email]).to include("を入力してください")
  end

  #本文がなければエラーメッセージが発生すること
  it "produces error message without content" do
    contact=Contact.new(name:'竹村',email:'example@ex.com')
    contact.valid?
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
