require 'rails_helper'

describe Blog do
  # タイトルがあれば有効な状態であること
  it "is valid with title" do
    blog=Blog.new(title:'竹村',content:'雨です')
    expect(blog).to be_valid
  end

  #タイトルがなければ無効であること
  it "is invalid without a title" do
    blog=Blog.new
    expect(blog).not_to be_valid
  end

  #タイトルがなければ無効であること
  it "is valid with title" do
    blog=Blog.new
    blog.valid?
    expect(blog.errors[:title]).to include("を入力してください")
  end
end
