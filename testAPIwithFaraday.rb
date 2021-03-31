#!/usr/bin/ruby

require 'faraday'
require 'json'
require 'pp'
require "test/unit/assertions"

include Test::Unit::Assertions


# Get the response from the GET API

res = Faraday.get 'https://jsonplaceholder.typicode.com/posts'  

# Get the status code from the response
status = res.status

puts '******Status*******'
puts status
puts '******Success*******'
puts res.success?
puts '******Headers*******'
pp res.headers
puts '*************'
puts res.headers['server']
puts res.headers['date']
puts res.headers['last-modified']
puts res.headers['content-type']
puts res.headers['content-length']

puts '******Body*******'
#Print the response body
#puts res.body

data = JSON.parse(res.body)

puts '******data*******'
#puts data

#Print userID from the first object of the JSon
puts '******data[0] userId *******' 
puts data[0]['userId']

#Print id from the first object of the JSon
puts '******data[0] id *******' 
puts data[0]['id']

#Print title from the first object of the JSon
puts '******data[0] title *******' 
puts data[0]['title']

#Print body from the first object of the JSon
puts '******data[0] id *******' 
puts data[0]['body']


# Print the Title & Body from the json
puts '******************** Print the title and body from the JSon *********************************'


(0..99).each do |i|
   puts '*************Title*************'
   puts "Contents of the Title for the index :#{i} is #{'"'} #{data[i]['title']} #{'"'}"
   puts '**************Body**************'
   puts "Body for the index :#{i} is #{'"'} #{data[i]['body']} #{'"'}"
   puts '********************************'
end

puts '******************** End of Values *********************************'



#Assertions

# Positive Test cases

assert_equal 200, status,'Both are not equal'

assert_equal "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", data[0]['title'], "Both the values not Equal"

assert_not_equal "sunt aut facere repellat provident occaecati excepturi optio reprehenderit_009_added", data[0]['title'], "Both the values are equal"

assert_same 1,data[0]['userId'],'Not same'


def test_status_code
    assert_equal 200, status
end


# Negative Test cases

 assert_equal 400, status,'Both are not equal'

 assert_equal "sunt aut facere repellat provident occaecati excepturi optio reprehenderit_added_to_check", data[0]['title'], "Both the values not Equal"






