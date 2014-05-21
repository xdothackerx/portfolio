class CommentsController < ApplicationController
# before_action :set_comment, only: [:show, :edit, :update, :destroy]
before_filter :load_post
# GET /comments
# GET /comments.json
def index
  @comments = @post.comments.all

end

# GET /comments/1
# GET /comments/1.json
def show
  @comment = Comment.find(params[:id])
  @comments = @post.comments.find(params[:id])
end

# GET /comments/new
def new
  @comment = @post.comments.new
end

# GET /comments/1/edit
def edit
  @comment = Comment.find(params[:id])

end

# POST /comments
# POST /comments.json
def create
  @comment = @post.comments.new(comment_params)
  respond_to do |format|
    if @comment.save
      format.html { redirect_to [@post], notice: 'Your comment has been submitted for approval.' }
      format.json { render :show, status: :created, location: @comment }
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /comments/1
# PATCH/PUT /comments/1.json
def update
  @comment = @post.comments.update(params[:id], comment_params)

  respond_to do |format|
    if @comment.update(comment_params)
      format.html { redirect_to post_comments_path, notice: 'Comment was successfully updated.' }
      format.json { render :show, status: :ok, location: @comment }
    else
      format.html { render :edit }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /comments/1
# DELETE /comments/1.json
def destroy
  @comment = @post.comments.destroy(params[:id])
  respond_to do |format|
    format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
# def set_comment
#   @comment = comment.find(params[:id])
# end

def load_post
  @post = Post.find(params[:post_id])
end

# Never trust parameters from the scary internet, only allow the white post through.
def comment_params
  params.require(:comment).permit(:content, :post_id, :author_email, (:approved if current_user == "editor"))
end
end
