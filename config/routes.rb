Phcmembers::Engine.routes.draw do

  namespace :directory do
    resources :categorylistings
  end
	# Dashboard (Engine Root)
	get 'dashboard/mains/index', :path => "dashboard"

	# Application API
	namespace :api do

		# Routes for API
		resources :catsapi, defaults: {format: 'json'} do
			resources :listapi
		end

	end

	# Application Client Backend

	# Members Section
	namespace :member do

		# Members Main Index
		root 'profiles#index'

		# Member Routes
		resources :profiles, class_name: 'Phcmembers::Member::Profile' do
			resources :listings, class_name: 'Phcmembers::Member::Listing'
			resources :addresses, class_name: 'Phcmembers::Member::Address'
		end

	end

	# Directory Section
	namespace :directory do

		# Members Main Index
		root 'categories#index'

		resources :categories, class_name: 'Phcmembers::Directory::Category'

	end

	# Connection Section
	namespace :connections do
		resources :memberaddresses, class_name: 'Phcmembers::Connections::Memberaddress'
		resources :memberlistings, class_name: 'Phcmembers::Connections::Memberlisting'
	end

end
