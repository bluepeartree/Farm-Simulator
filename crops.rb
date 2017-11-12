class Crops

@@all_crops_list = []

def initialize (type, food_value)
  @type = type
  @food_value = food_value
end

def type
  @type
end

def food_value
  @food_value
end

def all_crops_list
  @@all_crops_list
end

def type=(type)
  @type = type
end

def food_value=(food_value)
  @food_value = food_value
end

def all_crops_list=(all_crops_list)
  @@all_crops_list = all_crops_list
end

def self.create(type, food_value)
  new_crop = Crops.new(type, food_value)
  @@all_crops_list << new_crop
  return new_crop
end

def self.all
  @@all_crops_list
end

end

mango = Crops.create("Mango", 100)
Crops.create("Spinach", 90)

puts Crops.all.class
# puts Crops.all.to_s.include?("broccoli")
# puts mango.type.class

puts Crops.all.index("Mango")

Crops.all.each do |type|
  if type = "Mango"
    puts "yes"
  else
    puts "no"
  end
end
