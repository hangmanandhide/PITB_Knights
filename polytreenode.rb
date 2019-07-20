require "byebug"

class PolyTreeNode

  attr_accessor :children, :parent, :value

  def initialize(value, parent = nil)
    @parent = parent
    @children = []
    @value = value
  end

  def parent=(parent)
    old_parent = @parent

    if old_parent != nil
      old_parent.children.delete_if {|child| child == self }
    end

    @parent = parent
    if parent != nil && !parent.children.include?(self)
      parent.children << self
    end

  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)

    if child_node.parent.children.include?(child_node)
      child_node.parent = nil
    else 
     raise "Error: Node is not a child"
    end

  end

  def dfs(target_value)
    if self.value == target_value
      return self
    end
     
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end

    nil
  end

  def bfs(target_value)

    queue = [self]
    until queue.empty?
      now_serving = queue.shift
      
      if now_serving.value == target_value
        return now_serving
      else
        now_serving.children.each do |child|
          queue.push(child)
        end
      end
    end
    
    nil
  end


  def inspect
    { "parent" => @parent, "children" => @children, "value" => @value }.inspect
  end

end