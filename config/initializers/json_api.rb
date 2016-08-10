# Previous implementation that is no longer recommended based on this
# reference: https://github.com/rails/rails/pull/23712
#
# ActiveModel::Serializer.config.adapter = :json_api
#
# Mime::Type.register "application/json", :json, %w( text/x-json application/jsonrequest application/vnd.api+json )

require 'active_model_serializers/register_jsonapi_renderer'

ActiveModelSerializers.config.adapter = :json_api

# this serializes data so it sent from RAILS to the front end (Ember) in the format:

# {
  # "data": [
    # {
      # "id": "1",
      # "type": "posts",
      # "attributes": {
      # "title": "First Post",
      # "body": "This is a great post."
        # },
      # "relationships": {
        # "comments": {
        # "data": [
        # {
          # "id": "1",
          # "type": "comments"
        # }
          # ]
        # }
      # }
    # },
