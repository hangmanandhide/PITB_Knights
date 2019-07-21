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

  def initialize(starting_pos)
    @root_node = starting_pos
    @considered_positions = [starting_pos]
  end

  def find_path(end_pos)
    self.dfs(end_pos)
  end

  

  def build_move_tree
    self.root_node = PolyTreeNode.new(starting_pos)

    node_queue = [root_node]
   
    until node_queue.empty?
      now_serving = node_queue.shift

      current_pos = now_serving.value
      new_move_positions(current_pos).each do |next_pos|
        next_node = PolyTreeNode(next_pos)
        now_serving.add_child(next_node)
        node_queue << next_node
      end
    end
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