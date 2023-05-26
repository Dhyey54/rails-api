# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do |article|
  article_created = Article.create(title: "Article##{article}", body: "This is the body for the Article##{article}", release_date: rand(10.years).seconds.ago)
  rand(1..5).times do |comment|
    Comment.create(comment_content: "Comment #{comment}", date_of_comment: rand(article_created.release_date .. Date.today), article_id: article_created.id)
  end
end
