def merge_sort(array)
  # base case is when array only has 1 item
  return array if array.length == 1

  mid_position = array.length / 2
  array_left = array[0..(mid_position - 1)]
  array_right = array[mid_position..(array.length - 1)]
  array_left = merge_sort(array_left)
  array_right = merge_sort(array_right)

  new_array = []
  loop do
    break if array_left.empty? && array_right.empty?

    # p array_left
    # p array_right
    if array_right.empty?
      new_array += array_left
      array_left = []
    elsif array_left.empty?
      new_array += array_right
      array_right = []
    elsif array_left[0] <= array_right[0]
      new_array.push(array_left[0])
      array_left.delete_at(0)
    else
      new_array.push(array_right[0])
      array_right.delete_at(0)
    end
  end

  new_array
end

test_array = [3, 2, 1, 13, 8, 5, 0, 1]
test_array_2 = [105, 79, 100, 110]
p merge_sort(test_array)
p merge_sort(test_array_2)
