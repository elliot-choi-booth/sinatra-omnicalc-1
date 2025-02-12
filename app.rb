require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get ("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get ("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num)

  erb(:square_root_results)
end

get ("/payment/new") do
  erb(:new_payment)
end

get ("/payment/results") do
  @apr = params.fetch("apr_input").to_f / 1200

  @years = params.fetch("years_input").to_i * 12

  @principal = params.fetch("principal_input").to_f

  @result = @apr * @principal / (1 - (1 + @apr)) ** (@years * -1)

  erb(:payment_results)
end

get ("/random/new") do
  erb(:random_new)
end

get ("/random/results") do
  @minimum = params.fetch("min_input").to_f

  @maximum = params.fetch("max_input").to_f

  @result = rand(@minimum..@maximum)

  erb(:random_results)
end
