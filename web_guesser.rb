require 'sinatra'
require 'sinatra/reloader'

set :number, rand(101)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, locals: { number: settings.number, message: message }
end

private

  def bigger(value)
    difference = value - settings.number
    (difference > 5) ? 'Way too high!' : 'Too high!'
  end

  def smaller(value)
    difference = settings.number - value
    (difference > 5) ? 'Way too low!' : 'Too low!'
  end

def check_guess(guess)
  answer = guess.to_i
  if answer < settings.number
    smaller(answer)
  elsif answer > settings.number
    bigger(answer)
  else
    "You got it right! The secret number is #{settings.number}"
  end
end
