train_info = [
  {train: "72C", frequency_in_minutes: 15, direction: 'north'},
  {train: "72D", frequency_in_minutes: 15, direction: 'south'},
  {train: "610", frequency_in_minutes: 5, direction: 'north'},
  {train: "611", frequency_in_minutes: 5, direction: 'south'},
  {train: "80A", frequency_in_minutes: 30, direction: 'east'},
  {train: "80B", frequency_in_minutes: 30, direction: 'west'},
  {train: "110", frequency_in_minutes: 15, direction: 'north'},
  {train: "111", frequency_in_minutes: 15, direction: 'south'}
]

#
# Save the direction of train 111 into a variable.

train_111_direction = train_info.last[:direction]
puts train_111_direction
puts '-'*33

# Save the frequency of train 80B into a variable.
frequency_80b = train_info[5][:frequency_in_minutes]
# 80B_frequency = train_info[-3][:frequency_in_minutes] alternate way using the -ve count to start counting from the end of the list

puts frequency_80b
puts '-'*33


# Save the direction of train 610 into a variable.

train_610_direction = train_info[3][:direction]
puts train_610_direction
puts '-'*33

# Create an empty array. Iterate through each train and add the name of the train into the array if it travels north.

#we assign the variable to the function instead of creating a standalone empty array becuase the .select is pulling and array itself and retuns that into the variable
north_trains = train_info.select do |train|
  train[:direction] == "north"
end

puts north_trains
puts '-'*33


# Way #2
#
# if ever in doubt we can always use a .each{ |variable| instructions} for anything with an array

north_arr = []
 train_info.each { |train|
   if train[:direction] == "north"
     north_arr << train
   end
 }
 puts north_arr

puts '-'*33

# Do the same thing for trains that travel east.
east_trains = train_info.select { |train| train[:direction] == "east"}
puts east_trains
puts '-'*33

# Way2
east_arr = []
train_info.each { |train|
  if train[:direction] == "east"
    east_arr << train
  end
}
puts east_arr
puts '-'*33

#did the same for west and south for practice
south_trains = train_info.select {|train| train[:direction] == "south"}
puts south_trains
puts '-'*33

west_trains = train_info.select { |train| train[:direction] == "west"  }
puts west_trains
puts '-'*33

# You probably just ended up rewriting some of the same code. Move this repeated code into a method that accepts a direction and a list of trains as arguments, and returns a list of just the trains that go in that direction. Call this method once for north and once for east in order to DRY up your code.
def train_direction(direction, list)
# need to re-use the previous array iteration using .select but pass in the input variables of the list and direction which is string
  which_way = list.select {|train| train[:direction] == direction}
  puts which_way
end


train_direction("north", train_info)
puts
train_direction("east", train_info)
puts
train_direction("south", train_info)
puts
train_direction("west", train_info)
puts '-'*33


# Other ways completed by classmates -- this solution uses the .include? and the .mnap function and needs an empty array to start off with


# def group(array, direction)
#   included = array.select { |item| item[:direction].include?(direction) }
#   selected_trains = included.map { |item| item[:direction] }
# end
#
# group(trains, "north")
# group(trains, "east")

#solution by Josh -- this uses the .each iteration that i was using as a second method and then adds an empty array, then the if loop shovels the value of |train| when it equals the direction that is inputted

# def trains_direction(list_of_trains, direction)
#   train_direction = []
#   list_of_trains.each do |train|
#     if train[:direction] == direction
#       train_direction << train
#     end
#   end
#   puts train_direction
# end
#
# trains_direction(trains, "north")
# trains_direction(trains, "east")


# Pick one train and add another key/value pair for the first_departure_time. For simplicity, assume the first train always leave on the hour. You can represent this hour as an integer: 6 for 6:00am, 12 for noon, 13 for 1:00pm, etc.

train_info[0][:first_departure_time] = 3
puts '-'*33
puts train_info[0]
