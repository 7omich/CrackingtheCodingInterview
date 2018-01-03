class Tree
  class Branch
    def initialize(parent)
      @parent = parent
      @children = []
    end
    attr_accessor :parent, :children
  end

  def initialize(root)
    @root = root
    @node = [root]
    @lh = { root => Branch.new(nil) }
  end
  attr_reader :root

  def add(node, newchild)
    raise "Already newchild exists." if @node.include?(newchild)
    @node << newchild
    raise "Parent #{node} does not exist." unless @lh[node]
    @lh[node].children << newchild
    @lh[newchild] = Branch.new(node)
  end

  # Answer
  def get_children(node)
    @lh[node].children
  end

  def dfs(node1, node2)
    stack = [[node1, 0]]
    while !stack.empty?
      node, depth = stack.pop
      return depth if node == node2
      get_children(node).each do |child|
        stack.push([child, depth + 1])
      end
    end
    return false
  end
end

t = Tree.new(8)

t.add(8, 4); t.add(8, 10)
t.add(4, 2); t.add(4, 6)
t.add(6, 7)
t.add(10, 20)

p t.dfs(8, 20)  # 2
p t.dfs(4, 7)  # 2
p t.dfs(8, 40)  # false
