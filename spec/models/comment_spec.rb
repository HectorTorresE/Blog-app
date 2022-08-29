require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Mateo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.',
                       postscounter: 0)
    @user.save
    @new_post = Post.new(author: @user, title: 'Title', text: 'Text', commentscounter: 0, likescounter: 0)
    @new_post.save
    @new_comment = Comment.new(author: @user, text: 'Comment Text', post: @new_post)
    @new_comment.save
  end

  it 'update_comment_counter increments the post comment counter by 1' do
    expect(@new_post.commentscounter).to eq(0)
    @new_comment.update_comment_counter
    expect(@new_post.commentscounter).to eq(1)
  end
end
