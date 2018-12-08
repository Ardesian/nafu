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
