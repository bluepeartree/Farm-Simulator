class Field

  @@granary = 0
  @@farm = []
  @@vistas = ["The sun hangs low, casting an orange glow on a sea of", "As the summer breeze whistles around you, there is no calmer place than in the middle of your", "This is the life, just ambling on a perfect summer's day through your"]

  def initialize(type, size)
    @type = type
    @size = size
  end

  def type
    @type
  end

  def size
    @size
  end

  def size=(size)
    @size = size
  end

  def type=(type)
    @type = type
  end

  def self.field_setup
    puts "What kind of field is it?"
    response = gets.chomp
    if Crops.all.to_s.include?(response)
      puts "How large is the field in hectares?"
      size = gets.to_i
      Field.create(response, size)
      puts "Added a #{ response } field of #{ size } hectares!"
    else
      puts "Sorry, we don't grow that here!"
    end
  end

  def self.create(type, size)
    new_field = Field.new(type, size)
    @@farm << new_field
    return new_field
  end

  def self.whole_farm
    @@farm
  end

  def self.full_granary
    @@granary
  end

  def self.harvest
    @@farm.each do |field|
      food_value = 0
        Crops.all.each do |crop|
          if crop.type == field.type
            food_value = crop.food_value
          end
        end
      puts "Harvesting #{food_value*field.size } food from #{field.size} hectare #{field.type} field."
      @@granary = @@granary + (food_value*field.size)
    end
    puts "The farms has #{Field.full_granary} harvested food so far."
  end

  def self.status
    @@farm.each do |field|
      puts "#{ field.type } field is #{field.size} hectares."
    end
    puts "The farms has #{Field.full_granary} harvested food so far."
  end

  def self.relax
    count = 0
    if @@farm.length == 0
      puts "You haven't planted anything yet, no time to relax!"
    else
      @@farm.each do |field|
        puts "#{@@vistas[count]} #{field.size} hectares of #{field.type}."
        count +=1
      end
    end
  end

end

class Crops < Field

  @@all_crops_list = []

  def initialize (type, size, food_value)
    super(type, size)
    @food_value = food_value
  end

  def food_value
    @food_value
  end

  def all_crops_list
    @@all_crops_list
  end

  def food_value=(food_value)
    @food_value = food_value
  end

  def all_crops_list=(all_crops_list)
    @@all_crops_list = all_crops_list
  end

  def self.create(type, size, food_value)
    new_crop = Crops.new(type, size, food_value)
    @@all_crops_list << new_crop
    return new_crop
  end

  def self.all
    @@all_crops_list
  end

end

Crops.create("Mango", 0, 100)
Crops.create("Spinach", 0, 90)
# puts Crops.all.to_s
#
# Field.field_setup
# # puts Field.whole_farm.inspect
# # puts Crops.all.to_s
#
# Field.harvest
#
# Field.status
#
# Field.relax
