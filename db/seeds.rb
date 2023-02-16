# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
%i[
  短刀
  脇差
  打刀
  太刀
  大太刀
  槍
  薙刀
  剣
  青江
  粟田口
  長船
  兼定
  虎徹
  古備前
  三条
  貞宗
  左文字
  堀川
  正宗
  三池
  村正
  来
  その他
].each { |name| Genre.find_or_create_by(name:) }
genre_ids = Genre.all.pluck(:id)

Admin.create!(
  email: 'touken@doucoukai.com',
  password: 'touken112'
)
#touken_attributes.each do |touken_attribute|
  #Touken.find_or_create_by(
    #title: touken_attribute[:title],
    #user_id: touken_attribute[:user_id],
    #genre_id: genre_ids.sample
    #)
#end