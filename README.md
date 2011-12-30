# Has Vimeo Video

Validate a Vimeo URL attribute in Active Record, and retrieve access to the video's data through Vimeo API.


## Installation

Add to your Gemfile and run the `bundle` command to install it.

 ```ruby
 gem "has_vimeo_video"
 ```

**Requires Ruby 1.9.2 or later, and Rails 3.0.0 or later.**


## Usage

Call `has_vimeo_video` in an ActiveRecord class and pass the name of the attribute that will contain the URL for the video on Vimeo, e.g. http://vimeo.com/1234567890.

  ```ruby
  class Post < ActiveRecord::Base
    has_vimeo_video :video_url
  end
  ```

This will automatically validate the format of the URL to match Vimeo's, and will add a `vimeo` object to your model, which will contain the following methods:

* `info` will give you access to a hash with the parsed response from Vimeo API
* `id` will parse the id of the video from the URL (no API requests here)
* `embed_url` will return a URL ready for embedding your video (no API requests as well)
* `thumbnail` will return the URL for the large thumbnail from Vimeo API (the same as `info['thumbnail_large']`)

  ```ruby
  post = Post.create video_url: 'http://www.vimeo.com/32733074'
  post.vimeo.info # {"id"=>32733074, "title"=>"Belo Monte, Anúncio de uma Guerra (CATARSE)", "description"=>"Mais do que um filme, queremos que esse documentário seja um ato político da sociedade, uma luta pelo acesso à informação e pelo direito de participar das decisões do país.<br />\n<br />\nEntre em http://catarse.me/pt/projects/459-belo-monte-anuncio-de-uma-guerra, assista o vídeo e apoie essa causa.", "url"=>"http://vimeo.com/32733074", "upload_date"=>"2011-11-27 06:49:45", "mobile_url"=>"http://vimeo.com/m/32733074", "thumbnail_small"=>"http://b.vimeocdn.com/ts/221/819/221819626_100.jpg", "thumbnail_medium"=>"http://b.vimeocdn.com/ts/221/819/221819626_200.jpg", "thumbnail_large"=>"http://b.vimeocdn.com/ts/221/819/221819626_640.jpg", "user_name"=>"André Vilela D'Elia", "user_url"=>"http://vimeo.com/cinedelia", "user_portrait_small"=>"http://b.vimeocdn.com/ps/283/288/2832886_30.jpg", "user_portrait_medium"=>"http://b.vimeocdn.com/ps/283/288/2832886_75.jpg", "user_portrait_large"=>"http://b.vimeocdn.com/ps/283/288/2832886_100.jpg", "user_portrait_huge"=>"http://b.vimeocdn.com/ps/283/288/2832886_300.jpg", "stats_number_of_likes"=>221, "stats_number_of_plays"=>107330, "stats_number_of_comments"=>49, "duration"=>661, "width"=>640, "height"=>360, "tags"=>"belo, monte, anúncio, cinedelia, gota, guerra, catarse, indigenas, xingu, rio, river, raoni, kayapo, vivo, eletro, norte, felicio, pontes, pare, amazonia", "embed_privacy"=>"anywhere"}
  post.vimeo.id # 32733074
  post.vimeo.embed_url # http://player.vimeo.com/video/32733074
  post.vimeo.thumbnail # http://b.vimeocdn.com/ts/221/819/221819626_640.jpg
  ```

## Customizing validation message

You can customize the ActiveRecord validation message by passing the `message` option to `has_vimeo_video`.


  ```ruby
  class Post < ActiveRecord::Base
    has_vimeo_video :video_url, message: "only Vimeo URLs are allowed"
  end
  ```

## Development

Questions or problems? Please post them on the [issue tracker](https://github.com/softa/has_vimeo_video/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests passing by running `bundle` and `rake`.

This gem is created by Engage and is under the MIT License.