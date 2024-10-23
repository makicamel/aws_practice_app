# frozen_string_literal: true

class TodoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_)
    ActionController::Base.helpers.asset_path([version_name, 'default.jpg'].compact.join('_'))
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end
end
