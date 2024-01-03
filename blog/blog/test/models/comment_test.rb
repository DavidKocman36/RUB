require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create comment to article" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    article.save
    user = User.new(email: "", password: "password1", username: "Username")
    user.save

    comment = Comment.new(commenter: "User", text: "New comment hello.", user_id: user.id, article_id: article.id)
    assert comment.save
  end

  test "create comment article error" do
    user = User.new(email: "", password: "password1", username: "Username")
    user.save

    comment = Comment.new(commenter: "User", text: "New comment hello.", user_id: user.id)
    assert_not comment.save
  end

  test "create comment user error" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    article.save

    comment = Comment.new(commenter: "User", text: "New comment hello.", article_id: article.id)
    assert_not comment.save
  end

  test "create and delete" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    article.save
    user = User.new(email: "", password: "password1", username: "Username")
    user.save

    comment = Comment.new(commenter: "User", text: "New comment hello.", user_id: user.id, article_id: article.id)
    comment.save

    comment.destroy

    assert comment.destroyed?
  end
end
