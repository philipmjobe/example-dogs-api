class DogsController < ApplicationController

  def create
    if current_user
      dog = Dog.new(
        name: params["name"]
        age: params["age"]
        breed: params["breed"]
      )
      if dog.save
        render json: dog.as_json
      else  
        render json: {error: dog.errors.full_messages}
      end 
    else  
      render json: {error: "Please log in"}
    end 
  end 
end
