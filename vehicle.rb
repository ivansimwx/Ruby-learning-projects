module Raceable 
  def racing?(speed)
    speed > 100
  end
end

class Vehicle
  attr_accessor :colour, :model, :speed
  attr_reader :year
  @@number_of_vehicles = 0

  def initialize (y,c,m, s=0)
    super()
    @year = y
    @colour = c
    @model = m
    @speed = s
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicle(s)."
  end

  def self.mileage (gallons, miles)
    puts "#{miles/gallons} miles per gallon of gas"
  end

  def speed_up (number)
    @speed += number
    puts "You accelerated by #{@speed} km/h"
  end

  def brake (number)
     @speed =0
    puts "You decelerated by #{@speed} km/h"
  end

  def shutoff
    @speed = 0
    puts "We are parked"
  end

  def spray_paint (string)
    self.colour = string
    puts "Your new colour #{colour} is awesome"
  end

  def current_speed
    puts "Your current speed is #{@speed} km/h"
  end

  def age_disclose 
    puts "Age of vehicle is #{age}"
  end

  private
  def age
    Time.new.year - self.year
  end
end

class MyTruck < Vehicle
  NUMBER_OF_WHEELS = 6

  def to_s 
    "My truck is a #{self.colour}, #{self.year}, #{self.model}"
  end
end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4

  include Raceable

  def to_s 
    "My car is a #{self.colour}, #{self.year}, #{self.model}"
  end
end

class Students
  def initialize (name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(competitor)
    self.grade > competitor.grade
  end

  protected
  def grade
    @grade
  end
end

toyota = MyCar.new(2000,"blue", "toyota")
puts toyota.year
puts toyota.colour
puts toyota.model
puts toyota.current_speed
toyota.speed_up(5)
toyota.brake (10)
toyota.shutoff
toyota.spray_paint("white")
MyCar.mileage(100.0, 10)
puts toyota
Vehicle.number_of_vehicles
puts toyota.racing?(200)
toyota.age_disclose

david = Students.new("david", 90)
bob = Students.new("bob", 84)

puts "Well done!" if david.better_grade_than?(bob)

# puts Vehicle.ancestors
# puts MyCar.ancestors
# puts MyTruck.ancestors