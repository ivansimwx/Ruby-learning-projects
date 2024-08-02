# normal iteration for fibonacci sequence
def fibs(length)
  fibs_array = []
  fibs_array.push(0) if length >= 1
  fibs_array.push(1) if length >= 2

  i = 2 # 3rd index position
  while i <= length - 1
    fibs_array.push(fibs_array[i - 2] + fibs_array[i - 1])
    i += 1
  end
  fibs_array
end

# recursive for fibonacci sequence
def fibs_rec(length)
  return length if length < 2

  fibs_rec(length - 1) + fibs_rec(length - 2)
end

def fibs_print(length)
  # output = []
  output = (0..length).map { |i| fibs_rec(i) }
end

puts "Loop"
p fibs(0)
p fibs(1)
p fibs(8)

puts "\nRecursive"
p fibs_print(0)
p fibs_print(1)
p fibs_print(8)