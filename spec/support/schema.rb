require 'active_record'

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.integer :system_code
    t.string :name
    t.string :email
  end
end
