module HasVimeoVideo
  class Railtie < Rails::Railtie
    initializer 'has_vimeo_video.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end
    end
  end
end
