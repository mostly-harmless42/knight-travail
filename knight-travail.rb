
def knight_travail(start, goal)

  start = Square.new(start)
  goal = Square.new(goal)

  arr = [start]

  arr.each do |current| 
    current.move_list.each do |move| 
      return move.path_list if move.coord == goal.coord
      arr << move
    end
  end

end


class Square
  attr_accessor :coord, :prev

  def initialize(coord, prev = nil)
    @coord = coord
    @prev = prev
  end

  def move_list()
    (0..7).map { |i| [2 ** (i % 2) * ((-1) ** (i / 4)), 2 ** ((i + 1) % 2) * ((-1) ** (i / 2 % 2))] }
          .map { |a, b| [@coord[0] + a, @coord[1] + b] }
          .select { |a, b| a >= 0 and a < 8 and b >= 0 and b < 8 }
          .map { |coord| Square.new(coord, self) }
  end

  def path_list
    path = [self]
    path.each { |step| path << step.prev if step.prev }
        .map { |step| step.coord}
        .reverse
  end

end


knight_travail([0,0], [7,7]).each { |c| print c }
