require_relative "polytreenode"
class KnightPathFinder
  DELTAS = [
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
    @considered_positions = [starting_pos]
  end

  def build_move_tree(starting_pos)
    PolyTreeNode.new(starting_pos)
  end

  def valid_moves(pos)
    all_valid_moves = []
    board_size = 8

    x, y = pos

    DELTAS.each do |dx, dy|
      valid_x = x + dx
      valid_y = y + dy
      valid_move = [valid_x, valid_y]

      if valid_move.all? {|coord| coord.between?(0, board_size - 1)}
        all_valid_moves << valid_move
      end
    end

    all_valid_moves
  end

  def new_move_positions(pos)
    all_valid_moves = valid_moves(pos)
    potential_new_moves = []

    all_valid_moves.each do |valid_move|
      if !@considered_positions.include?(valid_move)
        potential_new_moves << valid_move
        @considered_positions << valid_move
      end
    end

    potential_new_moves
  end

  

end