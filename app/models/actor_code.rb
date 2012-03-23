class ActorCode < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  
  attr_accessor :num_to_generate
  after_create :generate_actor_code
  
  validates :app_id, :presence => true
  validates :user_id, :presence => true
  
   def generate_actor_code
    num_codes_created = user.num_actor_codes_generated
    self.code = add_noise(generate_raw_code(num_codes_created))
    #should not generate these characters
    #self.code.gsub('o','0').gsub('i','1').gsub('l','1').gsub('s','5')
    num_codes_created += 1
    user.update_attributes(:num_actor_codes_generated => num_codes_created)
    self.save!
    #return code
  end
  
  def add_noise(code)
    rand_num = remap_int(rand(36))
    code = code.insert(0,rand_num.chr)
    
    rand_num = remap_int(rand(36))
    code = code.insert(2,rand_num.chr)
  end

	def remap_int(rand_num)
	  if rand_num < 10
      rand_num += 48
    elsif rand_num == 18 # i => w
    	rand_num = 119
    elsif rand_num == 21 # l => x
    	rand_num = 120
    elsif rand_num == 24 # o => y
    	rand_num = 121
    elsif rand_num == 28 # s => z
    	rand_num = 122
    else
      rand_num += 87
    end
	end
	
  def generate_raw_code(gen_time)
    max_users = 10000
    k = 32
    return convert_to_base_k(k, self.user_id + (gen_time * max_users))
  end
  
  
  def convert_to_base_k(k, num)
    #Rails.logger.info("Number: #{num}")
    i = 3
    conversion_array = []
    while i >= 0
      if num > 0
      remainder = num % k #assumes k > 1
      num = (num - remainder)/k
      conversion_array[i] = remainder
      else
        conversion_array[i] = 0
      end
      i -= 1
      #Rails.logger.info("Remainder: #{remainder}")
    end
    
    conversion_string = ""
    
    conversion_array.each do |n|
      if n<10
        conversion_string += n.to_s
      elsif n == 18 # i => w
        conversion_string += "w"
      elsif n == 21 # l => x
        conversion_string += "x"
      elsif n == 24 # o => y
        conversion_string += "y"
      elsif n == 28 # s => z
        conversion_string += "z"
      else
        conversion_string += (n+87).chr
      end
    end
    
    return conversion_string
  end
end
