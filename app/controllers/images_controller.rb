class ImagesController < ApplicationController
  def show
    send_file "#{Rails.root}/private/uploads/#{params[:file_name]}.#{params[:extension]}"
  end

  private

  def image_params

  end
end
