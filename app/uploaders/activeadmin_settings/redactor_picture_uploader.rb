# encoding: utf-8
class ActiveadminSettings::RedactorPictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Instance
  def strip
    manipulate! do |img|
      img.strip
      img = yield(img) if block_given?
      img
    end
  end

  # process :quality => 85
  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage)
      img = yield(img) if block_given?
      img
    end
  end

  def extract_content_type
    if file.content_type == 'application/octet-stream' || file.content_type.blank?
      content_type = MIME::Types.type_for(original_filename).first
    else
      content_type = file.content_type
    end

    model.data_content_type = content_type.to_s
  end

  def set_size
    model.data_file_size = file.size
  end

  def read_dimensions
    if model.image? && model.has_dimensions?
      magick = ::MiniMagick::Image.new(current_path)
      model.width, model.height = magick[:width], magick[:height]
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "system/settings/redactor/pictures/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  process :read_dimensions

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [118, 100]
  end

  #version :content do
  #  process :resize_to_limit => [800, 800]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    ActiveadminSettings.image_file_types
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


  # Class
  def self.extended(base)
    base.class_eval do
      process :extract_content_type
      process :set_size
    end
  end
end
