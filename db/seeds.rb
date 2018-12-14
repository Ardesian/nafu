candidate = Candidate.create(
  password:   :password,
  fname:      "Rocco",
  mname:      "DJ",
  lname:      "Nicholls",
  email:      "rocco@zygy.com",
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
products = product_names.map { |product| Product.create(name: product) }

size_labels = ["5ml", "10ml", "15ml", "30ml", "Amber Bottle", "Blue Bottle", "Green Bottle"]
sizes = size_labels.map.with_index { |label, idx| ProductSize.create(name: label, amount_per_tray: 196, expected_time_in_minutes: 5 + idx) }

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
  size = sizes.sample
  puts "DEBUG: #{project.name}:#{product.name}:#{size.name}".colorize(:red)
  project.goals.create(project: project, product: product, product_size: size, desired_amount: (rand(10) + 5) * 1000)
end
