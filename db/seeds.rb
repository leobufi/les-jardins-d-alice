puts "Cleaning previous DB..."

Article.destroy_all
Product.destroy_all
Category.destroy_all
Rayon.destroy_all
Coffret.destroy_all
Formation.destroy_all
Jardin.destroy_all
User.destroy_all

User.create(email: 'admin@lja.com', password: '123456', admin: true)

4.times do
  article = Article.new(
    title: "Mes conseils perma",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    date: Time.now
  )
  if article.save
    puts '1 article made'
  else
    puts product.errors.messages
  end
end

2.times do
  coffret = Coffret.create(
    title: "Coffret Plaisir",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    price_cents: rand(1..20)
  )
  if coffret.save
    puts '1 Coffret made'
  else
    puts product.errors.messages
  end
end

Formation.create(
  title: "Stage été",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  dates: "from Mathusalem to Apocalypse"
)

puts 'Stagé dété made'

Formation.create(
  title: "Randonées à thèmes",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  dates: "from Mathusalem to Apocalypse"
)

puts 'Randonées à thèmes made'

Jardin.create(
  title: "Beuil",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
)

puts 'Beuil made'

Jardin.create(
  title: "Cantaron",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
)

puts 'cantaron made'

Rayon.create(
  title: "Herboristerie",
  selling_points: "3 boulevard Pierre Rabhi, 06000 Nice"
)
puts 'herbo made'

Rayon.create(
  title: "Épicerie",
  selling_points: "15 rue José Bové, 06000 Nice"
)
puts 'Épicerie made'

Category.create(
    title: "Tisanes",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.first
  )
puts 'Tisanes category made'

Category.create(
    title: "Huiles & Hydrolats",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.first
  )
puts 'Huiles & Hydrolats category made'

Category.create(
    title: "Bâtons de Fumigation",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.first
  )
puts 'Bâtons de Fumigation category made'

Category.create(
    title: "Macérats",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.first
  )
puts 'Macérats category made'

Category.create(
    title: "Sels",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.last
  )
puts 'Sels category made'

Category.create(
    title: "Confitures",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.last
  )
puts 'Confitures category made'

Category.create(
    title: "Autres",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    rayon: Rayon.last
  )
puts 'Autres category made'

15.times do
  product = Product.create(
    title: "Random product",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quantity: rand(1..20),
    price_cents: rand(1..20),
    origin: "La Montagne",
    coffret: Coffret.order(Arel.sql('RANDOM()')).first,
    category: Category.order(Arel.sql('RANDOM()')).first
  )
  if product.save
    puts '1 product made'
  else
    puts product.errors.messages
  end
end
