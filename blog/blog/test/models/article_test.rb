require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create article" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    assert article.save
  end

  test "create article error" do
    article = Article.new
    assert_not article.save
  end

  test "create and update" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    article.save

    article.update(title: "New Title")
    assert_equal article.title, "New Title"
  end

  test "create and delete" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    article.destroy

    assert article.destroyed?
  end

  test "create and update error" do
    article = Article.new(title: "Title", body: "Veeeeeeeeeeeeeeeeeeeeey long", prenex: "agaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaain")
    article.save

    assert_not article.update(body: "A")
  end
end
