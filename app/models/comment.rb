class Comment < ActiveRecord::Base
  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :blog

  after_save do
    #ブログ作成者とコメント投稿者(つまりカレントユーザ)が異なる場合、コメント投稿を通知する
    unless blog.user_id == user.id
      Pusher.trigger("user_#{blog.user_id}_channel",'comment_created',{
        message:'あなたの作成したブログにコメントが付きました'
      })
    end
    #お知らせの通知
    # binding.pry
    Pusher.trigger("user_#{blog.user_id}_channel", 'notification_created',{
      #Comment#user.notifications
      #コメント投稿者がブログ投稿者と同じものはカウントしない
      unread_counts: Notification.includes(:comment)
      .where(user_id: blog.user.id, read: false)
      .where.not(comments:{user_id: blog.user.id}).count
    })
  end

end
