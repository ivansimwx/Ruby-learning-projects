# normal iteration for fibonacci sequence
def fibs(length)
  fibs_array = length <= 1 ? [0] : [0, 1]

  i = 2 # 3rd index position
  while i <= length - 1
    fibs_array.push(fibs_array[i - 2] + fibs_array[i - 1])
    i += 1
  end
  fibs_array
end

# recursive for fibonacci sequence
def fibs_rec(length)
  puts "This was printed recursively"
  fibs_array = []
  return [0, 1] if length == 2
  return [0] if length <= 1

  fibs_array += fibs_rec(length - 1) # + fibs_rec(length - 2)

  fibs_array.push(fibs_array[fibs_array.length - 1] + fibs_array[fibs_array.length - 2])
end

puts "\nBy using loop, #{fibs(9)}"
puts "\n"
puts "By using recursive, #{fibs_rec(9)}"
