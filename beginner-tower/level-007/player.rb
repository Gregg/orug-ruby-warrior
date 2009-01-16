class Player
  
  def direction
    @direction ||= :backward
  end
  
  attr_reader :warrior
  attr_reader :health
  
  def charge!
    @charging = true
    puts "Charge!!!!"
    warrior.walk!(direction)
  end
  
  def redirect
    puts "Who put an f-ing wall here?"
    @direction = :forward
    warrior.walk!(direction)
  end
  
  def rest
    @charging = false
    puts "ZZZZZZ"
    warrior.rest!
  end
  
  def stroll
    puts "Strolling through the dungeon"
    warrior.walk!(direction)
  end
  
  def rescue!
    puts "Come to me baby"
    warrior.rescue!(direction)
  end
  
  def felt
    warrior.feel(direction)
  end
  
  def play_turn(warrior)
    @warrior = warrior
    if felt.empty?
      if attacked?
        charge!
      elsif warrior.health < 20 && !attacked?
        rest
      else
        stroll
      end
    elsif felt.captive?
      rescue!
    elsif felt.wall?
      redirect
    else
      if warrior.health <= 10 && !@charging
        puts "Retreat!!!!"
        warrior.walk!(direction == :forward ? :backward : :forward)
      else
        puts "Die, bitch!"
        warrior.attack!(direction)
      end
    end
    @health = warrior.health
  end
  
  def attacked?
    health && warrior.health < health
  end
end
