class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      if warrior.health >= 20 || (@health && warrior.health < @health)
        warrior.walk!
      else
        warrior.rest!
      end
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
    
    @health = warrior.health
  end
end
