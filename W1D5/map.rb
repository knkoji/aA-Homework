class Map

  def initialize
    @map = [[], []]
  end

  def assign(key, value)
    unless @map[0].include?(key)
      @map[0] << key
      @map[1] << value
      @map
    end
  end

  def lookup(key)
    index = @map[0].index(key)
    @map[1][index]
  end

  def remove(key)
    index = @map[0].index key
    @map.map { |e| e.delete_at(index) }
  end
end
