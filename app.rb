class App < Sinatra::Application
  get '/' do
    send_file 'views/index.html'
  end

  post '/message' do
  end
end
