require 'bundler'

Bundler.require(:default)

class BinaryTree
  attr_reader :left
  attr_reader :right
  attr_reader :value

  def initialize(left, right, value)
    @left = left
    @right = right
    @value = value.to_s
  end

  def self.create(array)

    array.sort!
    array_length = array.length

    if array_length.odd?
      root_index = (array_length-1)/2
    else
      root_index = (array_length/2)-1
    end


    array_left = array[(0...root_index)]
    array_right = array[(root_index+1...array_length)]

    if array_left.length>0
      left_child = BinaryTree.create(array_left)
    end

    if array_right.length>0
      right_child = BinaryTree.create(array_right)
    end
    
    node = BinaryTree.new(left_child,right_child,array[root_index])

  end

  def generate_graph_tree
    graph = GraphViz.new(:G, type: :graph)
    generate_graph_subtree(graph)
    graph
  end

  def generate_graph_subtree(graph)
    this_node = graph.add_nodes(value)
    if left
      left_node = left.generate_graph_subtree(graph)
      graph.add_edges(this_node, left_node)
    end
    if right
      right_node = right.generate_graph_subtree(graph)
      graph.add_edges(this_node, right_node)
    end
    this_node
  end

  def print_tree(file)
    generate_graph_tree.output(png: file)
  end
end
