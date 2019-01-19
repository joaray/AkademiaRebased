require 'minitest/autorun'
require_relative 'binary_tree'

class BinaryTreeTest < Minitest::Test
  def test_empty_array
    array=[]
    empty = BinaryTree.new(nil,nil,"")
    assert empty.left==nil&&empty.right==nil&&empty.value==nil.to_s, BinaryTree.create(array)
  end

  def test_array_one_element
    array=[2]
    root = BinaryTree.new(nil,nil,"2")
    assert root.left==nil&&root.right==nil&&root.value=="2", BinaryTree.create(array)
  end

  def test_array_two_elements
    array=[1,2]
    child = BinaryTree.new(nil,nil,"2")
    parent = BinaryTree.new(nil,child,"1")
    assert parent.left==nil&&parent.right==child&&parent.value=="1", BinaryTree.create(array)
    assert child.left==nil&&child.right==nil&&child.value=="2", BinaryTree.create(array)
  end

  def test_array_three_elements
    array=[1,2,3]
    child_left = BinaryTree.new(nil,nil,"1")
    child_right = BinaryTree.new(nil,nil,"3")
    parent = BinaryTree.new(child_left,child_right,"2")
    assert parent.left==child_left&&parent.right==child_right&&parent.value=="2", BinaryTree.create(array)
    assert child_left.left==nil&&child_left.right==nil&&child_left.value=="1", BinaryTree.create(array)
    assert child_right.left==nil&&child_right.right==nil&&child_right.value=="3", BinaryTree.create(array)
  end

end
