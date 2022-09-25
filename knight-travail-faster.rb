
def knight_travail(start, goal)

  def move_list(coord, trav_arr)
    (0..7).map { |i| [2 ** (i % 2) * ((-1) ** (i / 4)), 2 ** ((i + 1) % 2) * ((-1) ** (i / 2 % 2))] }
          .map { |a, b| [coord[0] + a, coord[1] + b] }
          .select { |a, b| a >= 0 and a < 8 and b >= 0 and b < 8 }
          .reject { |coord| trav_arr.include?(coord)}
  end

  def path_list(coord, path_hash)
    path = [coord]

    path.each do |current|
        path << path_hash[current] if path_hash[current]
    end

    path.reverse
  end

  path_hash = {start: nil}
  trav_arr = [start]

  trav_arr.each do |current|
    move_list(current, trav_arr).each do |move|
      path_hash[move] = current
      trav_arr << move

      return path_list(current, path_hash) if current == goal
    end
  end
end

100.times { print knight_travail([0, 0], [7,7]) }
