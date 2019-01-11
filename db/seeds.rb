# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TEAMS = [
  {
    name: "CivTrix Contracting"
  }
]

TEAMS.each do |attributes|
  Team.find_or_create_by(attributes)
end

team1 = Team.find_by(name: "CivTrix Contracting")

###############################################################################

USERS = [
  {
    email: "neo_anderson@example.com",
    first_name: "Neo",
    last_name: "Anderson",
    team_id: team1.id
  },
  {
    email: "john_wick@example.com",
    first_name: "John",
    last_name: "Wick",
    team_id: team1.id
  },
  {
    email: "samuel_jackson@example.com",
    first_name: "Samuel",
    last_name: "Jackson",
    team_id: team1.id
  }
]

USERS.each do |attributes|
  user = User.find_or_initialize_by(attributes)
  user.password = "Password101"
  user.save
end

###############################################################################

PROJECTS = [
  {
    name: "Beale St",
    number: "256",
    project_type: "Subdivision",
    team_id: team1.id
  },
  {
    name: "Fuschia Ln",
    number: "290",
    project_type: "Road",
    team_id: team1.id
  }
]

PROJECTS.each do |attributes|
  Project.find_or_create_by(attributes)
end

###############################################################################

MACHINES = [
  {
    name: "Semi Truck 1",
    team_id: team1.id
  },
  {
    name: "Nathan's silly ute",
    last_hour_count: 40563,
    team_id: team1.id
  },
  {
    name: "Regan's Tesla + trailer",
    last_hour_count: 1562,
    team_id: team1.id
  },
]

MACHINES.each do |attributes|
  Machine.find_or_create_by(attributes)
end

###############################################################################

MATERIALS = [
  {
    name: "White Sand",
    unit: "ton",
    team_id: team1.id
  },
  {
    name: "Small Rocks",
    unit: "truck",
    team_id: team1.id
  },
  {
    name: "Big Rocks",
    unit: "ton",
    team_id: team1.id
  },
]

MATERIALS.each do |attributes|
  Material.find_or_create_by(attributes)
end



