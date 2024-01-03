require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "get index" do
    get articles_url
    assert_response :success
  end

  test "create article redirect" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { body: "Test body is here heloooo", title: "Hello everybody", prenex: "a new prenex" } }
    end
  
    assert_redirected_to articles_path
  end

  test "update article" do
    article = articles(:one)

    patch article_url(article), params: { article: { title: "New title", body: "Test body is here heloooo", prenex: "a new prenex" } }

    assert_redirected_to article_path(article)
    
    article.reload
    assert_equal "New title", article.title
  end

  test "delete article" do
    article = articles(:one)
    assert_difference("Article.count", -1) do
      delete article_url(article)
    end

    assert_redirected_to articles_path
  end

  test "show article" do
    article = articles(:one)
    get article_url(article)
    assert_response :success
  end

end
