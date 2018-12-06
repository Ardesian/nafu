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
  references: "Sup",
)
user = candidate.approve!

puts "#{user.to_json}".colorize(:cyan)
