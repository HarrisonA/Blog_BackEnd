class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    # ActiveModelSerializers will automatically integrate with your Rails
    # app, so you won't need to update your controller here.
    # render json: @posts  (is all you need)
    render json: @posts, comments: @comments
    # note comments is added so all the comments are displayed also on
    # the get /posts route but this optional
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # ORIGINAL generated by Rails
    # Only allow a trusted parameter "white list" through.
    # def post_params
    #   params.require(:post).permit(:title, :body)
    # end

    # Updated
    # When data comes from front end (Ember) to be saved, deserialize it so
    # into a format Rails understands. In other words, configure
    #  our controllers to deserialize the incoming parameters – turn
    # them from JSON API into a standard Ruby hash.

    def post_params
      res = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      res # folowup: what is "res"?
    end
end
