class Comic < OpenStruct
  def image?
    images.any?
  end

  def thumb_path
    [thumbnail['path'], thumbnail['extension']].join('.')
  end

end