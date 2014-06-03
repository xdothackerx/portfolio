class CommentsController < ApplicationController
  before_filter :load_commentable

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
    @comment = @commentable.comments.new(comment_params)
    @comment.author = current_user.email
    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@commentable], notice: 'Your comment has been submitted for approval.' }
        format.json { render :show, status: :created, location: @comment }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        format.html { render template: "#{@resource}/show" }
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

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

  # Never trust parameters from the scary internet, only allow the white post through.
  def comment_params
    params.require(:comment).permit(*policy(@comment || Comment).permitted_attributes)
  end
end
