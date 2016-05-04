class String
  attr_reader :color_hash

  @color_hash = {:red => 31 , :green => 32,:yellow => 33,:blue => 34,:pink => 35 ,:light_blue => 94, :white => 97, :light_gray => 37,:black=> 30}

self.instance_eval do
  puts "about to create magic"
  def create_color
    @color_hash.each do |color,code|
      self.send(:define_method,"#{color}")do
        "\e[#{code}m" + self +"\e[0m"
      end
    end
  end

  def colors
    @color_hash.keys
  end

  def sample_colors
    puts "This is " + "red".red
    puts "This is " + "green".green
    puts "This is " + "yellow".yellow
    puts "This is " + "blue".blue
    puts "This is " + "pink".pink
    puts "This is " + "light_blue".light_blue
    puts "This is " + "white".white
    puts "This is " + "light_grey".light_grey
    puts "This is " + "black".black
  end
end


end

String.create_color
