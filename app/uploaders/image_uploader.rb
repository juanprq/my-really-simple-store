class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :normal do
    process resize_to_fill: [468, 336]
  end
end