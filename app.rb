class App < Sinatra::Application
  configure do
    set :public_folder, './public'
  end

  get '/' do
    erb :index
  end

  post '/message' do
  end
end
