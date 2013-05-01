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

  describe "Length of fields" do
    describe "title minimum length should be higher than 4" do
      before { @post.title = "a" * 4 }
      it { should_not be_valid }
    end  

    describe "title maximum length should be less than 51" do
      before { @post.title = "a" * 51 }
      it { should_not be_valid }
    end 

    describe "name maximum length should be less than 51" do
      before { @post.name = "a" * 51 }
      it { should_not be_valid }
    end  
  end  


  describe "Posts descending order of creation date" do
    let!(:older_post) do
        FactoryGirl.create(:post, created_at: 1.day.ago)
    end   
    let!(:newer_post) do 
        FactoryGirl.create(:post, created_at: 1.hour.ago)
    end
    
    it "should have the 2 posts in desc order" do
        Post.all.should == [newer_post, older_post]

    end    
  end
  

end
