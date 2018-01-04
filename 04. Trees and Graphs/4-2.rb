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

  def get_children(node)
    @lh[node].children
  end

  def dfs(node1, node2=nil)
    stack = [[node1, 0]]
    while !stack.empty?
      node, depth = stack.pop
      yield(node, depth) if block_given?
      return depth if node == node2
      get_children(node).each do |child|
        stack.push([child, depth + 1])
      end
    end
    return false
  end

  def put_out
    d = -1; st = ""
    ar = []
    dfs(@root) do |node, depth|
      lfs = "-- #{node} "
      if d < depth
        st += lfs
        ar.push(st.length)
        print lfs
        d = depth
      else
        l = ar[depth - 1]
        st = " " * l + lfs
        print("\n" + st)
        ar[depth] = st.length
        d = depth
      end
    end
    puts
  end

  # answer
  def self.make_minimum_bst(arr)
    med = arr.count / 2
    t = Tree.new(arr[med])
    make_bst_partial(t, arr[med], arr[0..med-1])
    make_bst_partial(t, arr[med], arr[med+1..-1])
    return t
  end

  def self.make_bst_partial(tree, node, arr)
    return if arr.count == 0
    if arr.count == 1
      tree.add(node, arr[0])
      return
    else
      med = arr.count / 2
      tree.add(node, arr[med])
      make_bst_partial(tree, arr[med], arr[0..med-1])
      make_bst_partial(tree, arr[med], arr[med+1..-1])
    end
  end
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
t = Tree.make_minimum_bst(arr)
t.put_out
