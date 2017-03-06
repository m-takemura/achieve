class Comment < ActiveRecord::Base
  has_many :notifications, dependent: :destroy

  belongs_to :user
  belongs_to :blog

  after_save do
    #ブログ作成者とコメント投稿者が異なる場合、コメント投稿を通知する
    unless blog.user_id == user.id
      Pusher.trigger("user_#{blog.user_id}_channel",'comment_created',{
        message:'あなたの作成したブログにコメントが付きました'
      })
    end
    #お知らせの通知
    # binding.pry
    Pusher.trigger("user_#{blog.user_id}_channel", 'notification_created',{
      #Comment#user.notifications
      unread_counts: Notification.where(user_id: blog.user.id, read: false).count
    })
  end

end
