require 'bcrypt'

# my_password = BCrypt::Password.create("my password")
# puts my_password         # it's gives us "$2a$12$ZlSOWR5vrfuVGCieVZGr7ulVdoldZriSBp025kOTpSUKOrJWWyC5O"

# my_password = BCrypt::Password.new("$2a$12$ZlSOWR5vrfuVGCieVZGr7ulVdoldZriSBp025kOTpSUKOrJWWyC5O")

# puts my_password == "my password"             # true explain each line of code so that i can understood why true


# lets do more expriment

 user = [
    {username: "chirag",
    password: "chirag@2001"},
    {username: "dhruvi",
    password: "dhruvi@2001"},
    {username: "varun",
      password: "varun@2000"}
]



def make_hash_version(password)
     BCrypt::Password.create(password)
end

def verify_hash_digest(password)
    BCrypt::Password.new(password)
end


def create_secure_password(list_of_users)
     list_of_users.each do |user|
         user[:password] = make_hash_version(user[:password])
     end

     list_of_users
end

puts create_secure_password(user)

# output 
# {:username=>"chirag", :password=>"$2a$12$xx89UvcLACjKSl83iPigK.tssxZqsSx/AelH.sW6UNSDdMrsLWILW"}
# {:username=>"dhruvi", :password=>"$2a$12$dqr1SXfg/2a85xJfaWXhsubBP4YW62IvagxJcLlBQZri40t4NhK2q"}
# {:username=>"varun", :password=>"$2a$12$v6m6IEpmPXFZOOTkKmREkO9wbGyilaSK24gJiac45UAKqwhQI9ZE2"}



def authenticate(username , password , list_of_users)
   list_of_users.each do |user|
    if user[:username] == username && verify_hash_digest(user[:password]) == password
      return user
    end
  end

  "Credentials not found"
end

3.times {puts}

puts authenticate("chirag" , "chirag@2001" , user)
puts authenticate("dhruvi" , "dhruvi@2001" , user)
puts authenticate("vaun" , "vaun@2001" , user)

# output
# {:username=>"chirag", :password=>"$2a$12$nPkA3z6tq2..l3qUPkd6w.82Pxj2.7PyqyRsF4zjTIDVULSAfYhDi"}
# {:username=>"dhruvi", :password=>"$2a$12$vru/w6o2DUxUhy14MlGm9.4Y0Xtb2zHtaQzrqwYp23MxH7eHPbMuG"}
# Credentials not found

