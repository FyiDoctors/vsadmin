# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Security.delete_all
secUser = Security.create([ role: "user", secret: "password"])
secUser = Security.create([ role: "admin", secret: "adminpassword"])

Fee.delete_all
fee = Fee.create([ from: "0", to: "10000", fee: "75.00"])
fee = Fee.create([ from: "10000", to: "30000", fee: "300.00"])
fee = Fee.create([ from: "30000", to: "50000", fee: "600.00"])
fee = Fee.create([ from: "50000", to: "70000", fee: "900.00"])
fee = Fee.create([ from: "70000", to: "90000", fee: "1200.00"])
fee = Fee.create([ from: "90000", to: "110000", fee: "1500.00"])
fee = Fee.create([ from: "110000", to: "130000", fee: "1800.00"])
fee = Fee.create([ from: "130000", to: "150000", fee: "2100.00"])
fee = Fee.create([ from: "150000", to: "175000", fee: "2450.00"])
fee = Fee.create([ from: "175000", to: "200000", fee: "2825.00"])
fee = Fee.create([ from: "200000", to: "225000", fee: "3200.00"])
fee = Fee.create([ from: "225000", to: "250000", fee: "3575.00"])
fee = Fee.create([ from: "250000", to: "275000", fee: "3950.00"])
fee = Fee.create([ from: "275000", to: "300000", fee: "4325.00"])
fee = Fee.create([ from: "300000", to: "325000", fee: "4700.00"])
fee = Fee.create([ from: "325000", to: "350000", fee: "5075.00"])
fee = Fee.create([ from: "350000", to: "375000", fee: "5450.00"])
fee = Fee.create([ from: "375000", to: "400000", fee: "5825.00"])
fee = Fee.create([ from: "400000", to: "425000", fee: "6200.00"])
fee = Fee.create([ from: "425000", to: "450000", fee: "6575.00"])
fee = Fee.create([ from: "450000", to: "475000", fee: "6950.00"])
fee = Fee.create([ from: "475000", to: "500100", fee: "7325.00"])

