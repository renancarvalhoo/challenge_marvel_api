module Marvel
  def self.characters(args = {})
    Client.new('get', 'characters', args)
  end

  def self.comics(params = {})
    Client.new('get', 'comics', params)
  end

  def self.character(id, params = {})
    Client.new('get', "characters/#{id}", params)
  end

  def self.character_comics(id, params = {})
    Client.new('get', "characters/#{id}/comics", params)
  end
end