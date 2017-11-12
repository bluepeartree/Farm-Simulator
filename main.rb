require './field.rb'

loop do
puts "--------------------
Options:
field -> adds a new field
harvest -> harvests crops and adds to total harvested
status -> displays some information about the farm
relax -> provides lovely descriptions of your fields
exit -> exits the program
--------------------"
  response = gets.chomp
  if response == "field"
    Field.field_setup
  elsif response == "harvest"
    Field.harvest
  elsif response == "status"
    Field.status
  elsif response == "relax"
    Field.relax
  elsif response == "exit"
    break
  else
    puts "That is not a valid response."
  end
end
