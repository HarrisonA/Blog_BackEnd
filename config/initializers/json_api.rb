ActiveModel::Serializer.config.adapter = :json_api

Mime::Type.register "application/json", :json, %w( text/x-json application/jsonrequest application/vnd.api+json )

# this serializes data so it sent from RAILS to the front end (Ember) in the formt:

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
