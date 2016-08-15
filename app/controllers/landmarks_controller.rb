class LandmarksController < ApplicationController



  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id/edit' do

    @landmark = Landmark.find(params[:id])
    @landmark.name=(params[:landmark][:name])
    year = params[:landmark][:year_completed]
    year = year.to_i
    @landmark.year_completed=(year)
    @landmark.save

    
    redirect to "landmarks/#{@landmark.id}"

  end

  post '/landmarks' do

    @landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure = Figure.create(params[:figure])
    end
    redirect to "landmarks/#{@landmark.id}"
  end

end
