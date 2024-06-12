module ApplicationHelper
  def image_exists?(image)
    File.exist?(image)
  end
end
