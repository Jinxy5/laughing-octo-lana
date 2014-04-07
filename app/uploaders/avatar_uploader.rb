# encoding: utf-8

class AvatarUploader < BaseUploader

  include CarrierWave::RMagick
  
  storage :file

  process resize_to_fit: [75, 75]
  process convert: 'gif'
     
  def default_url
 
  end
 


end
