class Client < ApplicationRecord
    require 'net/http'

	def self.get_menu
		#Other dishes menu
		uri = URI('http://localhost:3000/other_dishes')
		response =  Net::HTTP.get(uri) 
		@other_dishes = JSON.parse response
		#Pizza types menu
		uri = URI('http://localhost:3000/pizza_types')
		response =  Net::HTTP.get(uri) 
		@pizza_types = JSON.parse response
		#Cheeses menu
		uri = URI('http://localhost:3000/cheeses')
		response =  Net::HTTP.get(uri) 
		@cheeses = JSON.parse response
		#Sizes menu
		uri = URI('http://localhost:3000/sizes')
		response =  Net::HTTP.get(uri) 
		@sizes = JSON.parse response
		#Crusts menu
		uri = URI('http://localhost:3000/crusts')
		response =  Net::HTTP.get(uri) 
		@crusts = JSON.parse response
		#Sauces menu
		uri = URI('http://localhost:3000/sauces')
		response =  Net::HTTP.get(uri) 
		@sauces = JSON.parse response
		#Ingredients
		uri = URI('http://localhost:3000/ingredients')
		response =  Net::HTTP.get(uri) 
		@ingredients = JSON.parse response
	end


    def self.client_iteration
		# Client.get_menu
		while(true)
			puts "hola"
			sleep([*10..20].sample)
		end
	end
end
