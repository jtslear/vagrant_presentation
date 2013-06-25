require "rubygems"
require "sinatra/base"

class MyApp < Sinatra::Base

  get '/' do
    '<h1>Hello,</h1><br />Apache and unicorn? Thank you much!'
  end

end
