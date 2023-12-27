require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "create comment" do
    article = articles(:one)
    
    user = users(:one)
    sign_in user

    assert_difference("Comment.count") do
      post article_comments_path(article.id), params: { comment: { text: "New epic comment"} }
    end
  
    assert_redirected_to article_path(article)
  end

  test "create comment notauth" do
    article = articles(:one)
    assert_raises(NoMethodError) { post article_comments_path(article.id), params: { comment: { text: "New epic comment"} }}
  end

  test "delete comment" do
    article = articles(:one)
    comment = comments(:one)

    assert_difference("Comment.count", -1) do
      delete article_comment_path(article.id, comment.id)
    end

    assert_redirected_to article_path(article)
  end

end
