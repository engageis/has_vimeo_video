require 'spec_helper'

class Post < SuperModel::Base
  extend HasVimeoVideo::ModelAdditions
  has_vimeo_video :video_url
end

class PostWithMessage < SuperModel::Base
  extend HasVimeoVideo::ModelAdditions
  has_vimeo_video :video_url, message: "must be a Vimeo URL"
end

describe HasVimeoVideo::ModelAdditions do
  
  subject{ Post.new video_url: "http://vimeo.com/32733074" }
  
  its(:vimeo) do
    subject.id.empty?.should be_false
    subject.info.empty?.should be_false
    subject.embed_url.empty?.should be_false
    subject.thumbnail.empty?.should be_false
  end
  
  it "should have a valid Vimeo video URL" do
    Post.new(video_url: "http://www.vimeo.com/foobar").should_not be_valid
    Post.new(video_url: "http://vimeo.com/foobar").should_not be_valid      
    Post.new(video_url: "http://www.youtube.com/17298435").should_not be_valid
    Post.new(video_url: "http://youtube.com/17298435").should_not be_valid

    Post.new(video_url: "https://www.vimeo.com/17298435").should be_valid
    Post.new(video_url: "http://www.vimeo.com/17298435").should be_valid
    Post.new(video_url: "http://vimeo.com/17298435").should be_valid
  end
  
  it "should have a customized error message on validation failures" do
    subject = Post.new(video_url: "http://youtube.com/17298435")
    subject.should_not be_valid
    subject.errors[:video_url].should == ["only Vimeo URLs are allowed"]
    subject = PostWithMessage.new(video_url: "http://youtube.com/17298435")
    subject.should_not be_valid
    subject.errors[:video_url].should == ["must be a Vimeo URL"]
  end
  
end
