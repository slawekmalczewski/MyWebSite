# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PostCategory.create(:postcategoryname =>"Test Category",:PostCategory_Description=>"Test Category Description")
Post.create(:post_category_id =>1, :Post_Title=>"Test Title", :Post_Author=>"Author Test Name", :Post_Body=>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt")
PhotoGallery.create(:gallerytitle=>"Gallery Test Title", :galleryAuthor=>"Gallery Test Author", :galleryPosition=>1,:galleryDescription=>"Gallery Test Description")
