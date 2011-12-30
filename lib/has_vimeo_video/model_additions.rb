module HasVimeoVideo
  module ModelAdditions

    def has_vimeo_video(attribute, options = nil)
      message = (options and options[:message]) || "only Vimeo URLs are allowed"
      validates_format_of attribute, with: HasVimeoVideo::VimeoVideo.regex, message: message
      self.class_eval <<-EOF
        def vimeo
          return @vimeo if @vimeo
          @vimeo = HasVimeoVideo::VimeoVideo.new self.#{attribute}
        end
      EOF
    end
        
  end
end
