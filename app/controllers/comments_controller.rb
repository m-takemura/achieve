class CommentsController < ApplicationController
  def create
    @comment=current_user.comments.build(comment_params)
    @blog=@comment.blog
    @notification = @comment.notifications.build(user_id: @blog.user.id)

    respond_to do |format|
      if @comment.save
        # unless @comment.blog.user_id == current_user.id
        #   Pusher.trigger("user_#{@comment.blog.user_id}_channel",'comment_created',{message:'あなたの作成したブログにコメントが付きました'})
        # end

        format.html{redirect_to blog_path(@blog), notice:'コメントを投稿しました。'}
        format.json{render :show, status: :created, location: @comment }
        format.js{render :index}
      else
        format.html{render :new}
        format.json{render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment=Comment.find(params[:id])
    @blog=@comment.blog
    @comment.destroy

    respond_to do |format|
      # redirect_to blog_path(@blog)
      format.html{redirect_to blog_path(@blog), notice:'コメントを削除しました。'}
      format.js{render :index}
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end
