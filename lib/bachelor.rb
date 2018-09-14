require 'pry'

def get_first_name_of_season_winner(data, season)
  name = nil
  data.each do |season_num, contestant|
    if season  == season_num
    # this checks that we are only looking at the correct season.
      contestant.each do |info|
      # I had to iterate down again to seperate the array of contestants
        if info["status"] == "Winner"
        # checks the status is "Winner"
          name = info["name"].split[0]
          # assigns the winners name to name variable
          # uses split to create an array, then returns the first index
          # so that we only keep the winners first name.
        end
      end
    end
  end
  return name
end

def get_contestant_name(data, occupation)
# very similar to Part 1 of this lab.
  name = nil
  data.each do |season_num, contestant|
  # removed the season check
    contestant.each do |info|
    # again, iterated down to individual keys in the arrays.
      if info["occupation"] == occupation
      # for this check, used the occupation input to verify match.
        name = info["name"]
        # here we need the full name so simply return the string.
      end
    end
  end
  return name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_num, contestant|
    contestant.each do |info|
      if info["hometown"] == hometown
        count += 1
        # adds +1 to count each time the hometown is found.
      end
    end
    # originally had 'return count' here but it didn't loop.
  end
  return count
  # placed correctly so it loops through each iteration of the hash.
end

def get_occupation(data, hometown)
  data.each do |season_num, contestant|
    contestant.each do |info|
    # we use the standard iterations down to the contestant info.
      if info["hometown"] == hometown
      # checks that the hometown matches the user input
        return info["occupation"]
        # if true, returns the occupation within that hash.
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data.each do |season_num, contestant|
    if season  == season_num
    # this checks that we are only looking at the correct season.
      contestant.each do |info|
      # Iterate down again to seperate the array of contestants
        age_array << info["age"].to_i
        # shoves << the ages into the age_array.
        # I used .to_i to change the strings to integers.
      end
    end
  end
  return (age_array.inject{|sum, el| sum + el}.to_f / age_array.size).round

end

# "season 10":[
#    {
#       "name":"Tessa Horst",
#       "age":"26",
#       "hometown":"San Francisco, CA",
#       "occupation":"Social Worker",
#       "status":"Winner"
#    },
#    {
#       "name":"Bevin Nicole Powers",
#       "age":"28",
#       "hometown":"Palo Alto, CA",
#       "occupation":"Assistant",
#       "status":"Week 8"
#    },
