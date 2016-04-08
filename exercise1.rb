classroom = []

# we need to collect input from a user to complete the seating chart
puts "How many rows would you like in your classroom?"
number_of_rows = gets.chomp.to_i

i = 1
while i <= number_of_rows
  puts "How many seats in row #{i}?"
  number_of_seats = gets.chomp.to_i
  row = []
  j = 1
  while j <= number_of_seats
    puts "Name of the person in seat #{j} in row #{i}? (hint: type in \"empty\" if the seat is empty)"
    student_name = gets.chomp
    if  student_name == "empty"
      student_name = nil
    end
    row << student_name
    j += 1
  end

  classroom << row
  i += 1
end



for row in classroom
  puts "-" * 80
  for name in row
    if name.nil?
      print "[empty]" + (" " * 5)
    else
      if ["jasmine", "deri", "deven"].include? name
        print "|" + (" " * 4)
      end
      print name + (" " * (12-name.length))
      if ["carlos", "brian", "kevin", "juan"].include? name
        print "|" + (" " * 4)
      end
    end
  end
  puts
  puts "-" * 80
  # print "#{row[0, 4]}" "(80-name.length)-row.length"
end
