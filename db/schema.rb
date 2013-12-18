# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130208025441) do

  create_table "alternativos", :force => true do |t|
    t.integer "primario",                 :null => false
    t.string  "secundario", :limit => 45
  end

  create_table "equivalencias", :force => true do |t|
    t.string   "codigo"
    t.integer  "filtro"
    t.integer  "marca",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equivalencias", ["filtro"], :name => "FK_filtro"

  create_table "filtro_vehiculos", :force => true do |t|
    t.integer  "vehiculo",   :null => false
    t.integer  "filtro",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "filtro_vehiculos", ["filtro"], :name => "FK_filtro_2"
  add_index "filtro_vehiculos", ["vehiculo"], :name => "FK_vehiculo_1"

  create_table "filtros", :id => false, :force => true do |t|
    t.integer  "id",                                :null => false
    t.string   "codigo",                            :null => false
    t.string   "diametro_exterior A", :limit => 30
    t.string   "diametro_interior A", :limit => 30
    t.float    "peso"
    t.float    "altura"
    t.string   "rosca",               :limit => 30
    t.float    "largo"
    t.float    "ancho"
    t.integer  "tipo",                              :null => false
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diametro nominal",    :limit => 30
    t.string   "diametro_exterior B", :limit => 30
    t.string   "diametro_interior B", :limit => 30
  end

  add_index "filtros", ["tipo"], :name => "FK_tipo_1"

  create_table "imagens", :force => true do |t|
    t.string   "direccion"
    t.integer  "filtro",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imagens", ["filtro"], :name => "FK_filtro_1"

  create_table "marca_vehiculos", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.string   "nombre",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_filtros", :id => false, :force => true do |t|
    t.integer  "id",                       :null => false
    t.string   "nombre",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nivel",      :limit => 45
  end

  create_table "tipo_vehiculos", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.string   "nombre",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "user"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin",      :limit => 1, :default => 0
    t.datetime "last_login"
  end

  create_table "vehiculos", :force => true do |t|
    t.string   "modelo"
    t.integer  "marca",      :null => false
    t.integer  "tipo",       :null => false
    t.string   "desde"
    t.string   "hasta"
    t.string   "motor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehiculos", ["marca"], :name => "FK_marca_1"
  add_index "vehiculos", ["tipo"], :name => "FK_tipo_2"

end
