class Client < ApplicationRecord
    require 'http'

	def self.get_menu
		#Other dishes menu
        @other_dishes = JSON.parse(HTTP.get("http://localhost:3000/other_dishes").body)
        # Pizza types menu
        @pizza_types = JSON.parse(HTTP.get("http://localhost:3000/pizza_types").body)
        #Cheeses menu
        @cheeses = JSON.parse(HTTP.get("http://localhost:3000/cheeses").body)
        #Sizes menu
        @sizes = JSON.parse(HTTP.get("http://localhost:3000/sizes").body)
        #Crusts menu
        @crusts = JSON.parse(HTTP.get("http://localhost:3000/crusts").body)
        #Sauces menu
        @sauces = JSON.parse(HTTP.get("http://localhost:3000/sauces").body)
        #Ingredients
        @ingredients = JSON.parse(HTTP.get("http://localhost:3000/ingredients").body)
	end

    def self.other_dish_order
        HTTP.post("http://localhost:3000/orders", :params => { 'other_dish_id': @other_dishes[0]["id"] })
        puts "Other dish ordered"
    end

    def self.pizza_order
        @pizza = JSON.parse(HTTP.post("http://localhost:3000/pizzas", :params => { 'cheese_id':@cheeses[0]['id'],'crust_id':@crusts[0]['id'],'pizza_type_id':@pizza_types[0]['id'],'sauce_id':@sauces[0]['id'],'size_id':@sizes[0]['id'] }).body)
        HTTP.post("http://localhost:3000/orders", :params => { 'pizza_id': @pizza["id"] })
        puts  "Pizza ordered"
    end

    def self.client_orders
        Client.get_menu
		while(true)
            clients = rand(1..3)
            puts clients.to_s + " client(s) will order"
            clients.times do |client|
                orders_number = rand(1..5)
                puts "client " + (client+1).to_s + " will order " + orders_number.to_s + " orders"
                orders_number.times do |order|
                    if [true, false].sample
						#Other Dish order
						Client.other_dish_order
					else
						#pizza Order
						Client.pizza_order
					end
                end
            end
			sleep([*10..20].sample)
		end
	end
end
