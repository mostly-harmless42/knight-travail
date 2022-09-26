
def knight_travail(start, goal)


  def move_list(coord, trav_arr)
    [[1,2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]]
      .map { |a, b| [coord[0] + a, coord[1] + b] }
      .reject { |a, b| a < 0 or a > 7 or b < 0 or b > 7 }
      .reject { |co| trav_arr.include?(co) }
  end


  def path_list(coord, path_hash)
    path_arr = [coord]
    path_arr.each { |current| path_arr << path_hash[current] if path_hash[current] }.reverse
  end


  path_hash = {start: nil}
  trav_arr = [start]

  trav_arr.each do |current|

    move_list(current, trav_arr).each do |move|
      path_hash[move] = current
      return path_list(move, path_hash) if move == goal
      trav_arr << move
    end

  end

end

1000.times{ print knight_travail([0, 0], [7, 7]) }