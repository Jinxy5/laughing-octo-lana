# encoding: utf-8

class AvatarUploader < BaseUploader

  include CarrierWave::RMagick
  
  storage :file

  process resize_to_fit: [75, 75]
  process convert: 'gif'
     

#include Sprockets::Helpers::RailsHelper

#include Sprockets::Helpers::IsolatedHelper





  def filename
    random_string + '.gif'
  end
  
  def random_string
    @random_string ||= User.new_remember_token
  end


end
