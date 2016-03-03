class App < Sinatra::Application
  configure do
    set :public_folder, './public'
  end

  get '/' do
    send_file 'views/index.html'
  end

  post '/message' do
  end
end
