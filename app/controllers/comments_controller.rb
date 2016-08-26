class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    # ActiveModelSerializers will automatically integrate with your Rails
    # app, so you won't need to update your controller routes. NOTE: Updates exist in private section below
    # render json: @comments  (is all you need here)
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Original from Rails

    # Only allow a trusted parameter "white list" through.
    #  def comment_params
    #   params.require(:comment).permit(:author, :body, :post_id)
    # end

    # Updated
    # When data comes from front end (Ember) to be saved, deserialize it so
    # into a format Rails understands. In other words, configure
    #  our controllers to deserialize the incoming parameters – turn
    # them from JSON API into a standard Ruby hash.

    def comment_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
