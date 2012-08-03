class ActiveadminSettings::Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :data_file_size
  field :data_content_type
  field :width,   :type => Integer
  field :height,  :type => Integer

  # Features
  mount_uploader :data, ActiveadminSettings::RedactorPictureUploader

  # Scopes
  default_scope order_by(:created_at => :desc)

  # Helpers
  def has_dimensions?
    respond_to?(:width) && respond_to?(:height)
  end

  def image?
    ActiveadminSettings::IMAGE_TYPES.include?(data_content_type)
  end

  def url
    data.url
  end

  def image
    url
  end

  def thumb
    data.thumb.url
  end

  def as_json_methods
    [:image, :thumb]
  end

  def as_json(options = nil)
    options = {
      :methods => as_json_methods
    }
    super options
  end
end