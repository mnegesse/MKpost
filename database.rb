# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/

# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'
require './models/post.rb'
require './models/comment.rb'
require 'time'
#require classes
# require './models/cake.rb'
require './models/car.rb'
require './models/customer.rb'
require './models/sale.rb'
require './models/user.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/carson.db'
)
# nowTime = Time.now
# user = User.create(user_name: "mikpost", password: "Mikpost123", email: "mikpost@gb.com", image: "a;ksdjf;jkahf.jpg", age: 0, bio: "welcome to my page", time: nowTime)
#
# post = Post.create(content: "fist post on this site", user_id: user.id, time: nowTime)
#
# Comment.create(content: "fist comment on a post", user_id: user.id, post_id: post.id, time: nowTime)
# Comment.create(content: "fist comment on a post2", user_id: user.id, post_id: post.id, time: nowTime)
# Comment.create(content: "fist comment on a post3", user_id: user.id, post_id: post.id, time: nowTime)
# Comment.create(content: "fist comment on a post4", user_id: user.id, post_id: post.id, time: nowTime)
binding.pry
