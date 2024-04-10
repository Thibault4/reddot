class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent_comment, class_name: 'Comment', optional: true
  has_many :children, class_name: 'Comment', foreign_key: :parent_comment_id, dependent: :destroy
  def recursive_comments(comment)
    comment.children.each do |child_comment|
      render partial: 'comments/comment', locals: { comment: child_comment, post: post }
      recursive_comments(child_comment)
    end
  end
end
