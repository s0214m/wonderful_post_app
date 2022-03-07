# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create!([{id: 1, name: "学習"}, {id: 2, name: "就活"}, {id: 3, name: "雑学"}, {id: 4, name: "その他"}])
3.times do |i|
  i += 1
  user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
    _user.password = 'test1234'
  end

  50.times do |ii|
    ii += 1
    article = user.articles.find_or_create_by!(title: "No.#{ii}: user00#{i}の記事") do |_article|
      _article.content = "No.#{ii}: user00#{i}の記事の本文"
    end
      4.times do |iii|
        iii += 1
        article.tag_articles.find_or_create_by!(tag_id: iii) do |tag_article|
        tag_article.article_id = ii
        end
      end
  end
end
