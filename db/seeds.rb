candidate = Candidate.create(
  password:   :password,
  fname:      "Rocco",
  mname:      "DJ",
  lname:      "Nicholls",
  email:      "rocco@rdjn.me",
  address1:   "8062 S Lismore Ln",
  city:       "West Jordan",
  state:      "UT",
  zip:        "84088-2517",
  cell_phone: "3852599640",
  home_phone: "3852599640",
  citizen:    true,
  felony:     false,
  education:  "Sup",
  references: "Sup"
)
candidate.approve!
candidate.user.update(role: :admin)

candidate = Candidate.create(
  password:   :password,
  fname:      "Test",
  mname:      "AB",
  lname:      "User",
  email:      "test@user.com",
  address1:   "123 Fake St",
  city:       "That City",
  state:      "UT",
  zip:        "84123",
  cell_phone: "123-456-7890",
  home_phone: "123-456-7890",
  citizen:    true,
  felony:     false,
  education:  "Sup",
  references: "Sup"
)

candidate.approve!
candidate = Candidate.create(
  password:   :password,
  fname:      "Sup",
  mname:      "AB",
  lname:      "Sup",
  email:      "sup@sup.com",
  address1:   "123 Fake St",
  city:       "That City",
  state:      "UT",
  zip:        "84123",
  cell_phone: "123-456-7890",
  home_phone: "123-456-7890",
  citizen:    true,
  felony:     false,
  education:  "Sup",
  references: "Sup"
)
candidate.approve!

product_names = ["Alert (Orange)", "Breathe (Green)", "Crave (Yellow)", "Harmony (Blue)", "Serene (Purple)", "Travel (Pink)"]
sizes = ["5ml", "10ml", "15ml", "30ml"]
colors = ["Blue", "Orange", "Amber", "Green"]

products = product_names.map do |product_name|
  Product.create(name: product_name)
end

styles = sizes.map do |size|
  colors.map do |color|
    ProductStyle.create(color: color, size: size, amount_per_tray: 192)
  end
end.flatten

duty_names = ["Prep", "Insert", "Hammer", "Cap", "Drill", "QC Caps"]
duties = duty_names.map { |duty| Duty.create(name: duty) }

project = Project.create(
  name: "Filling Stock",
  start_date: 1.month.ago
)

project = Project.create(
  name: "Harmon's 12/10",
  start_date: 1.week.ago,
  end_date: 1.week.from_now,
)
products.sample(5).each do |product|
  style = styles.sample
  puts "DEBUG: #{project.name}:#{product.name}:#{style.name}".colorize(:red)
  project.goals.create(project: project, product: product, product_style: style, desired_amount: (rand(10) + 5) * 1000)
end
