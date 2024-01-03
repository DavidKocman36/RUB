# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

art_text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent id justo in neque elementum ultrices. Mauris elementum mauris vitae tortor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Nullam eget nisl. Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus. Duis condimentum augue id magna semper rutrum. Donec iaculis gravida nulla. Pellentesque pretium lectus id turpis. Sed ac dolor sit amet purus malesuada congue. Proin pede metus, vulputate nec, fermentum fringilla, vehicula vitae, justo. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. Fusce nibh. Nullam sapien sem, ornare ac, nonummy non, lobortis a enim. Morbi scelerisque luctus velit. Duis condimentum augue id magna semper rutrum. Fusce suscipit libero eget elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
Comment.destroy_all
User.destroy_all
Article.destroy_all

admin_user = User.create(username: "Admin", password: "neconeco", admin: true, email: "")
first_user = User.create(username: "user1", password: "neconeco", admin: false, email: "")
second_user = User.create(username: "user2", password: "neconeco", admin: false, email: "")
third_user = User.create(username: "user3", password: "neconeco", admin: false, email: "")

admin_user.save!
first_user.save!
second_user.save!
third_user.save!



art1 = Article.create(title: "First", body: art_text, prenex: "Lorem ipsum!")
art2 = Article.create(title: "Second", body: art_text, prenex: "Lorem ipsum!")
art3 = Article.create(title: "Third article", body: art_text, prenex: "Lorem ipsum!")
art4 = Article.create(title: "New One!", body: art_text, prenex: "New article to start your day with!")
art5 = Article.create(title: "Hello World article", body: art_text, prenex: "Hello everybody!")
art6 = Article.create(title: "The global crisis", body: art_text, prenex: "Stop already!")

art1.save!
art2.save!
art3.save!
art4.save!
art5.save!
art6.save!

comm1 = Comment.create(commenter: first_user.username, text: "Oh wow, nice article!", article_id: art1.id, user_id: first_user.id)
comm2 = Comment.create(commenter: first_user.username, text: "I am from Ohio.", article_id: art2.id, user_id: first_user.id)
comm3 = Comment.create(commenter: second_user.username, text: "Santa is coming!", article_id: art1.id, user_id: second_user.id)
comm4 = Comment.create(commenter: second_user.username, text: "Well hello there!", article_id: art5.id, user_id: second_user.id)
comm5 = Comment.create(commenter: second_user.username, text: "I really like the way this article is artistically written.", article_id: art6.id, user_id: second_user.id)
comm6 = Comment.create(commenter: third_user.username, text: "Oh wow, nice article!", article_id: art3.id, user_id: third_user.id)
comm7 = Comment.create(commenter: third_user.username, text: "Oh wow, nice article!", article_id: art6.id, user_id: third_user.id)
comm8 = Comment.create(commenter: third_user.username, text: "Oh wow, nice article!", article_id: art4.id, user_id: third_user.id)

comm1.save!
comm2.save!
comm3.save!
comm4.save!
comm5.save!
comm6.save!
comm7.save!
comm8.save!