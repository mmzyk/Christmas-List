# Create a Christmas given list.  Given a file with each person on a single line
# create a list that pairs each person with another that they shoudl get a gift for.

def find_pair(person)
  total = @pairs.length
  pick = rand(total)
  if invalid_pair? pick,person
    pair = @pairs.delete_at(pick)
  else 
    pair = find_pair(person)  
  end  
  pair  
end

def read_people
  persons = Array.new
  f = File.open("people.txt", "r")
  f.each_line do |line|
    persons << line.strip
  end
  persons
end  
  

def invalid_pair?(pick, person)
  valid = true
  if same_person? pick,person
    valid = false
  end
  valid
end      
  
def same_person?(pick, person) 
  same = false
  if @pairs[pick] == person
    same = true
  end
  same  
end   
  
@peoples = read_people
@pairs = @peoples.dup  
list = Hash.new
@peoples.each do |person|
  list[person] = find_pair(person)
end  

list.each do |key, value|
  print "#{key}: #{value} \n" 
end  



  