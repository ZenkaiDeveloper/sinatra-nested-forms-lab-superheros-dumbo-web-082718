require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :index
    end

    post "/teams" do
      @team = Team.new(params[:team])
      params[:team][:members].each do |hero_data|
        Hero.new(hero_data)
      end
      @heros = Hero.all
      erb :team
    end

end
