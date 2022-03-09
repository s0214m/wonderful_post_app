# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザーが3つ作られる。
# メールアドレス:"user001@test.com"
# パスワード: "test1234"
# 各ユーザーに紐づいたメモがそれぞれ50個ずつ作られる
# タイトル:No.1: user001の記事
# 本文:No.1: user001の記事の本文
# seedファイルを複数回実行しても、同じ内容のデータが出来ないように制御してください

# 3.times do |i|
#   i += 1
#   user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
#     _user.password = "test1234"
#   end

#     50.times do |ii|
#       ii += 1
#       user.articles.find_or_create_by!(title: "No.#{ii}: user00#{ii}の記事") do |article|
#         article.content = "No.#{ii}: user00#{ii}の記事の本文"
#       end
#     end
# end

#usersの配列を作成
# users =
# 3.times.map do |i|
#   i += 1
#   User.find_or_create_by!(email: "user00#{i}@test.com") do |user|
#     user.password = "test1234"
#   end
# end
# # users = [{email: "user001@test.com", password: "test1234"},{email: "user002@test.com", password: "test1234"}, ...]

# #emailからuser_nameを切り取る
# #user_name配列に対してeach文を回す
# #userに紐づいたarticleを作る user.articles.find_or_create_by!(title: No.1:#{user_name}の記事) do

# users.each do |user|
#   user_name = user.email.gsub("@test.com","")

#   50.times do |i|
#     i += 1
#     user.articles.find_or_create_by!(title: "No.#{i}:#{user_name}の記事") do |article|
#       article.content = "No.#{i}:#{user_name}の記事の内容"
#     end
#   end
# end

# users =
# 3.times.map do |i|
#   User.find_or_create_by!(email: "user00#{i}@test.com") do |user|
#     user.password = "test1234"
#   end
# end
# #記事がなければ作り、新しいものは更新する
# users.each do |user|
#   user_name = user.email.gsub("@test.com","")

#   article = user.articles.find_or_initialize_by(title: "No.1:#{user_name}の記事")
#   article.update!(content: "No.1:#{user_name}の記事の内容") if article.new_record?
# end

#tagを作るtag = [{id: 1, name: "学習"}, ...]
tags = %w[学習 就活 雑学 その他]
tags.each {|tag| Tag.find_or_create_by!(name: tag)}
#idは作成されるときに自動で作られるので指定する必要がない
3.times do |i|
  i += 1
  user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
    _user.password = "test1234"
  end

    50.times do |ii|
      ii += 1
      user.articles.find_or_create_by!(title: "No.#{ii}: user00#{ii}の記事") do |article|
        article.content = "No.#{ii}: user00#{ii}の記事の本文"
        article.tag_ids = Tag.all.pluck(:id)
      end
    end
end
