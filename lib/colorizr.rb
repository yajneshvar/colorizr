class String
  attr_reader :color_hash

  @color_hash = {:red => 31 , :green => 32,:yellow => 33,:blue => 34,:pink => 35 ,:light_blue => 94, :white => 97, :light_grey => 37,:black=> 30}

  self.instance_eval do
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
      @color_hash.each_key do |color|
        puts "This is " + "#{color}".send("#{color}")
      end
      return nil 
    end
  end


end

String.create_color
