# encoding: utf-8

class BaseUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "private"
  end

  def extension_white_list
    %w\jpg jpeg gif png\
  end

  def filename
    random_string + '.gif'
  end
  
  def random_string
    @random_string ||= User.new_remember_token
  end

end
