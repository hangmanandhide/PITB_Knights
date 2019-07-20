require_relative "polytreenode"
class KnightPathFinder

  def initialize(starting_pos = [0,0])
    @root_node = PolyTreeNode.new(starting_pos)
  end

end