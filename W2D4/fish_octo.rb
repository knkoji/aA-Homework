
arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def quadratic(arr)

  i = 0
  while i < arr.length - 1
    max_length = true
    j = i + 1
    while j < arr.length
      max_length = false if arr[i].length > arr[j].length
      j += 1
    end
    i += 1
    return arr[i] if max_length
  end

end


class Array

  def merge_sort(&prc)
    prc ||= proc { |left, right| left.length <=> right.length}
    return self if length < 2
    m = length / 2
    left = self[0...m].merge_sort
    right = self[m..-1].merge_sort
    merge(left, right, &prc)
  end

  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first, &prc)
      when 1
        merged << right.shift
      when 0
        merged << left.shift
      when -1
        merged << left.shift
      end
    end
    right

  end

end


def linear_search(arr)
  biggest_fish = ''


  i = 0
  while i < arr.length - 1
    if arr[i].length > arr[i + 1].length
      biggest_fish = arr[i]
    else
      biggest_fish = arr[i + 1]
    end
    i += 1
  end
  biggest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def find_tile_linear(arr, tile)
  arr.each_with_index do |t, i|
    return i if t == tile
  end
end

tiles_hash = {
  'up' => 1,
  'right-up' => 2,
  'right' => 3,
  'right-down' => 4,
  'down' => 5,
  'left-down' => 6,
  'left' => 7,
  'left-up' => 8
}
def find_tile_hash(hash, tile)
  hash[tile]
end

puts "\n\n\n\n\n"
puts "O(n^2): #{quadratic(arr)}"
puts "O(n log n) merge sort: #{arr.merge_sort.join}"
puts "O(n) linear iteration: #{find_tile_linear(tiles_array, 'up')}"
puts "O(1) hash lookup: #{find_tile_hash(tiles_hash, 'up')}"

puts("\n\n\n\n\n\n\n\n")
