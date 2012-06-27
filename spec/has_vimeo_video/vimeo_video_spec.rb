require 'spec_helper'

describe HasVimeoVideo::VimeoVideo do

  def new_video url
    HasVimeoVideo::VimeoVideo.new(url)
  end
  
  subject{ new_video "http://vimeo.com/32733074" }

  its(:id){ should == "32733074" }

  its(:info) do
    subject["id"].should == 32733074
    subject["title"].empty?.should be_false
    subject["description"].empty?.should be_false
    subject["url"].empty?.should be_false
    subject["thumbnail_small"].empty?.should be_false
    subject["thumbnail_medium"].empty?.should be_false
    subject["thumbnail_large"].empty?.should be_false
  end
  
  its(:embed_url){ should == "http://player.vimeo.com/video/32733074" }

  it "should have a thumbnail that is equal to Vimeo's 'thumbnail_large'" do
    subject.thumbnail.should == subject.info["thumbnail_large"]
  end

  it "should have a zeroed info object if the video doesn't exist" do
    new_video("http://vimeo.com/000000000").info.should == "0"
  end
  
  it "should have a nil thumbnail if the video doesn't exist" do
    new_video("http://vimeo.com/000000000").thumbnail.should be_nil
  end
  
  it "should correctly parse video_url" do
    new_video(" http://vimeo.com/6428069 ").id.should == "6428069"
    new_video("xyzhttp://vimeo.com/6428069bar").id.should == "6428069"
  end
  
  it "should have a nil info object even if we get an error from Vimeo" do
    Vimeo::Simple::Video.stubs(:info).returns(Exception.new)
    subject.info.should be_nil
  end
  
end
