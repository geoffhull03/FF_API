require 'api_constraints'

FfApi::Application.routes.draw do
  namespace :api, defaults: { format: :json },
                            constraints: { subdomain: 'api' }, path: '/'  do
            scope module: :v1, constraints: APIConstraints.new(version: 1, default: true) do

        end
    end
end
