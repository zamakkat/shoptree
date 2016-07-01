namespace :dev do
  desc 'Create example data'
  task data: :environment do
    puts '==  =='
    categories_hash = {
      makeup: {
        face: ['foundation', 'moisturizer', 'concealer', 'highlighter'],
        eye: ['mascara', 'eyeliner', 'eyeshadow', 'under-eye concealer'],
        cheek: ['blush', 'bronzer' , 'contour', 'highlighter'],
        lip: ['lipstick', 'lip stain', 'lip gloss']
      },
      skin_care: {
        moisturizers: ['moisturizers', 'night creams', 'face oils'],
        cleansers: ['face wash & cleansers', 'makeup removers', 'toners'],
        masks: ['face masks', 'sheet masks']
      },
      fragrance: {
        women: ['perfume', 'lotions & oils', 'body mist & hair mist', 'bath & shower'],
        men: ['cologne', 'body sprays & deodorant', 'bath & shower']
      }
    }

    def nice_titleize(item)
      item.to_s.humanize.gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    puts '== Starting to create categories =='
    categories_hash.each do |cat, subcategories_hash|
      category = Category.find_or_create_by(name: nice_titleize(cat), parent: nil)
      FactoryGirl.create_list(:product, Faker::Number.between(0, 5), category: category)

      puts "- #{nice_titleize(cat)}"
      subcategories_hash.each do |sub_cat, sub_sub_cat_array|
        sub_category = Category.find_or_create_by(name: nice_titleize(sub_cat), parent: category)
        FactoryGirl.create_list(:product, Faker::Number.between(0, 5), category: sub_category)

        puts "    + #{nice_titleize(sub_cat)}"
        sub_sub_cat_array.each do |sub_sub_cat|
          sub_sub_category = Category.find_or_create_by(name: nice_titleize(sub_sub_cat), parent: sub_category)
          FactoryGirl.create_list(:product, Faker::Number.between(0, 15), category: sub_sub_category)
          puts "        #{nice_titleize(sub_sub_cat)}"
        end
      end
    end
  end
end
