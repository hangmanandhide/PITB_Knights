require_relative "polytreenode"
class KnightPathFinder
  ALL_VALID_MOVES = [
    [2, -1],
    [1, -2],
    [-1, -2],
    [-2, -1],
    [-2, 1],
    [-1, 2],
    [1, 2],
    [2, 1]
  ].freeze

  def initialize(starting_pos = [0,0])
    @root_node = build_move_tree(starting_pos)
  end

  def build_move_tree(starting_pos)
    PolyTreeNode.new(starting_pos)
  end

  def valid_moves(pos)

  end

end