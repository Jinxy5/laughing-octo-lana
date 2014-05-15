class StoryUploader < BaseUploader

  include CarrierWave::RMagick
  
  storage :file

 # version :thumb do
#  scope :approved, -> { where( state: 'approved') }
 
  process resize_to_fill: [800, 504]
 # end

 # version :full do
    
 # end

  
  process convert: 'jpg'
     

#include Sprockets::Helpers::RailsHelper

#include Sprockets::Helpers::IsolatedHelper




  def default_url
    '/awdaw.jpg'
  end

  def filename
    random_string + '.jpg'
  end
  
  def random_string
    @random_string ||= User.new_remember_token
  end


end
