# encoding: utf-8

class AppartmentImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def image
    @image ||= MiniMagick::Image.open( model.send(mounted_as).path )
  end

  def image_width
    image[:width]
  end

  def image_height
    image[:height]
  end

  def scale_image
    width = image_width #function defined above
    height = image_height #function defined above

    if width && height && width > height
      process :resize_to_fit => [224, 320, '#000']
    else
      process :resize_to_fill => [224, 320, '#000']
    end
  end

  # Create different versions of your uploaded files:
  version :thumb do
    #process :resize_thumb
    #resize_to_height 300
    #process :resize_to_height
    #process :scale => [300, 300]
    process :resize_to_fill => [300, 300]
  end

  def save_best_ratio
    image_width = 0
    image_height = 0

    manipulate! do |img|
      #image_width = img['width']
      #image_height = img['height']
      @geometry = [ img.columns, img.rows ]
    end

    if image_width >= image_height
      process :resize_to_fill => [960, 600]
    else
      process :resize_to_fill => [600, 960]
    end

    #[image_width, image_height]
  end

  def do_staff
    image_width = 0
    image_height = 0

    manipulate! do |img|
      image_width = img['width']
      image_height = img['height']
      #@geometry = [ img.columns, img.rows ]

      if image_width >= image_height
        img.resize_to_fill 960, 600
      else
        img.resize_to_fill 600, 960
      end
    end


  end

  def my_scale_method
    manipulate!  do |img|
      #overlay_path = Rails.root.join("app/assets/images/stamp_overlay.png")
      #overlay = Magick::Image.read(overlay_path).first
      #source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)
      #source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
      #colored = Magick::Image.new(70, 70) { self.background_color = color }
      #colored.composite(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)

      image_width = img.columns
      image_height = img.rows

      if image_width >= image_height
        img.resize_to_fill 960, 600
      else
        img.resize_to_fill 600, 960
      end
    end
  end

  version :large_image do
    #process :resize_to_fit => [800, 800]
    #process :save_best_ratio
    #image_size = get_size
    #process :scale_image
    #scale_image
    process :my_scale_method
  end

  # resizes an image, while preserving the original aspect ratio,
  # such that the new height is `height'. The values for the first parameters in the calls to `resize_to_fit' are
  # just upper-bounds to ensure that the image is filled completely in the vertical direction.
  def resize_to_height(height)
    manipulate! do |img|
      if img.rows >= height
        # here we're sizing down, so the new width cannot be more than img.columns
        img.resize_to_fit!(img.columns, height)
      else
        # should rarely be called; here we're sizing up, so if we scale the height by height.fo_f / img.rows, then the new width
        # can't be more than 2 * (img.columns * (height.to_f / img.rows)).ceil, since aspect the aspect ratio is preserved. (The 2
        # is unncessary, and is just there to be safe ;)
        img.resize_to_fit!(2 * (img.columns * height.to_f / img.rows).ceil, height)
      end
      img = yield(img) if block_given?
      img
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
