class StoryUploader < BaseUploader

  include CarrierWave::RMagick
  
  storage :file

  process resize_to_fit: [800, 504]
  process convert: 'jpg'
     

#include Sprockets::Helpers::RailsHelper

#include Sprockets::Helpers::IsolatedHelper





  def filename
    random_string + '.jpg'
  end
  
  def random_string
    @random_string ||= User.new_remember_token
  end


end
