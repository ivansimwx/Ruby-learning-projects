def bubble_sort(listofitems)
  #at the 2nd last index, we are already comparing with the last index
  loop_max_index = listofitems.length-2 

  #flag to check for whether sorting is completed
  sorted = false

  while sorted == false 
    #change the flag to true since we are sorting it
    sorted = true
    for i in 0..loop_max_index
      if listofitems[i]>listofitems[i+1]
        #swap positions
        temp = listofitems[i]
        listofitems[i] = listofitems[i+1]
        listofitems[i+1] = temp
        #when any swap happens, we cannot confirm that sorting is complete so flag is set to false
        sorted = false 
      end
    end
  end

  return listofitems
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([4,3,78,2,0,2,1,4,12,6,1,36])
