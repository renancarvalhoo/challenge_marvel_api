module Marvel

  def self.characters
    Client.new('get', 'characters')
  end

  def self.comics
    Client.new('get', 'comics')
  end

  def self.character(id)
    Client.new('get', "characters/#{id}")
  end

  def self.character_comics(id)
    Client.new('get', "characters/#{id}/comics")
  end
end