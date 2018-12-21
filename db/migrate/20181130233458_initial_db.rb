class InitialDb < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :phone
      t.integer :role, default: User.roles[:trainee]

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

    create_table :candidates do |t|
      t.belongs_to :user # optional (Required after approved)
      t.string :encrypted_password, null: false, default: ""
      # Desired password?
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :email

      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :cell_phone
      t.string :home_phone

      t.boolean :citizen
      t.boolean :felony

      t.text :education
      t.text :references

      t.datetime :approved_at
      t.datetime :denied_at

      t.timestamps
    end

    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    create_table :goals do |t|
      t.belongs_to :project # required
      t.belongs_to :product # required
      t.belongs_to :product_style # required
      t.integer :current_amount
      t.integer :desired_amount

      t.timestamps
    end

    create_table :trays do |t|
      t.belongs_to :project # required
      t.belongs_to :product # required
      t.belongs_to :product_style # required
      t.integer :tray_number # (special- unique per project/product)

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.boolean :available

      t.timestamps
    end

    create_table :product_styles do |t|
      t.string :color
      t.string :size
      t.boolean :available
      t.integer :amount_per_tray

      t.timestamps
    end

    create_table :duties do |t|
      t.string :name
      t.boolean :available

      t.timestamps
    end

    create_table :project_bottle_types do |t|
      t.belongs_to :project
      t.belongs_to :duty
      t.belongs_to :product_style
      t.integer :minutes_per_tray
      t.boolean :available

      t.timestamps
    end

    create_table :pauses do |t|
      t.belongs_to :user
      t.belongs_to :shift
      t.belongs_to :assignment

      t.datetime :started_at
      t.datetime :ended_at
    end

    create_table :assignments do |t|
      t.belongs_to :user # required
      t.belongs_to :project # required
      t.belongs_to :shift # required
      t.belongs_to :product # required
      t.belongs_to :product_style # required
      t.belongs_to :tray # required
      t.belongs_to :duty # required
      t.integer :filled
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end

    create_table :shifts do |t|
      t.belongs_to :team_lead # required
      t.belongs_to :user # required
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end

    create_table :notes do |t|
      t.belongs_to :author # required
      t.belongs_to :tray # optional - If any broke, tray is sticky, etc
      t.belongs_to :assignment # optional - Broke X bottles
      t.belongs_to :user # optional - Sucks at Filling
      t.text :body

      t.timestamps
    end


    create_table :active_storage_blobs do |t|
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments do |t|
      t.string     :name,     null: false
      t.references :record,   null: false, polymorphic: true, index: false
      t.references :blob,     null: false

      t.datetime :created_at, null: false

      t.index [ :record_type, :record_id, :name, :blob_id ], name: "index_active_storage_attachments_uniqueness", unique: true
    end
  end
end
