require 'spec_helper'

describe Post do
  before do
        @post = Post.new(name: "Mishu", title: "One lost letter",
                content: "by John Luke Karagiale")
  end  

  subject { @post }

  it { should respond_to :name }
  it { should respond_to :title }
  it { should respond_to :content }

  it { should be_valid }
  describe "When name is not present" do
    before { @post.name = " " }
    it { should_not be_valid }
  end
  

  describe "When title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "When content is not present" do
    before { @post.content = " " }
    it { should_not be_valid }
  end  
  describe "Title uniqueness" do
    before do 
        another_post = @post.dup
        another_post.save
    end    

    it { should_not be_valid }
  end

  describe

end
