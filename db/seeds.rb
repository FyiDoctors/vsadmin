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
fee = Fee.create([ from: "0", to: "10000", fee: "50.00", model_id: 1])
fee = Fee.create([ from: "10000", to: "30000", fee: "200.00", model_id: 1])
fee = Fee.create([ from: "30000", to: "50000", fee: "400.00", model_id: 1])
fee = Fee.create([ from: "50000", to: "70000", fee: "600.00", model_id: 1])
fee = Fee.create([ from: "70000", to: "90000", fee: "800.00", model_id: 1])
fee = Fee.create([ from: "90000", to: "110000", fee: "1000.00", model_id: 1])
fee = Fee.create([ from: "110000", to: "130000", fee: "1200.00", model_id: 1])
fee = Fee.create([ from: "130000", to: "150000", fee: "1400.00", model_id: 1])
fee = Fee.create([ from: "150000", to: "175000", fee: "1625.00", model_id: 1])
fee = Fee.create([ from: "175000", to: "200000", fee: "1875.00", model_id: 1])
fee = Fee.create([ from: "200000", to: "225000", fee: "2125.00", model_id: 1])

fee = Fee.create([ from: "0", to: "10000", fee: "75.00", model_id: 2])
fee = Fee.create([ from: "10000", to: "30000", fee: "300.00", model_id: 2])
fee = Fee.create([ from: "30000", to: "50000", fee: "600.00", model_id: 2])
fee = Fee.create([ from: "50000", to: "70000", fee: "900.00", model_id: 2])
fee = Fee.create([ from: "70000", to: "90000", fee: "1200.00", model_id: 2])
fee = Fee.create([ from: "90000", to: "110000", fee: "1500.00", model_id: 2])
fee = Fee.create([ from: "110000", to: "130000", fee: "1800.00", model_id: 2])
fee = Fee.create([ from: "130000", to: "150000", fee: "2100.00", model_id: 2])
fee = Fee.create([ from: "150000", to: "175000", fee: "2450.00", model_id: 2])
fee = Fee.create([ from: "175000", to: "200000", fee: "2825.00", model_id: 2])
fee = Fee.create([ from: "200000", to: "225000", fee: "3200.00", model_id: 2])
fee = Fee.create([ from: "225000", to: "250000", fee: "3575.00", model_id: 2])
fee = Fee.create([ from: "250000", to: "275000", fee: "3950.00", model_id: 2])
fee = Fee.create([ from: "275000", to: "300000", fee: "4325.00", model_id: 2])
fee = Fee.create([ from: "300000", to: "325000", fee: "4700.00", model_id: 2])
fee = Fee.create([ from: "325000", to: "350000", fee: "5075.00", model_id: 2])
fee = Fee.create([ from: "350000", to: "375000", fee: "5450.00", model_id: 2])
fee = Fee.create([ from: "375000", to: "400000", fee: "5825.00", model_id: 2])
fee = Fee.create([ from: "400000", to: "425000", fee: "6200.00", model_id: 2])
fee = Fee.create([ from: "425000", to: "450000", fee: "6575.00", model_id: 2])
fee = Fee.create([ from: "450000", to: "475000", fee: "6950.00", model_id: 2])
fee = Fee.create([ from: "475000", to: "500000", fee: "7325.00", model_id: 2])

Tax.delete_all

tax = Tax.create([ province: "ON", rate: 13, prate: 0, name: "HST"])
tax = Tax.create([ province: "BC", rate: 12, prate: 7, name: "GST+PST"])
tax = Tax.create([ province: "AB", rate: 5, prate: 0, name: "GST"])
tax = Tax.create([ province: "MB", rate: 13, prate: 8, name: "GST+PST"])

Clinic.delete_all
clinic = Clinic.create([ vendorid: "VN0003000", vsid: "0", vsvendorid: "", name: "Test Vendor VS", address: "Test ST, Oakville, ON", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003001", vsid: "1", vsvendorid: "GALL01", name: "Gall & Associates - Optometrists", address: "506 Kerr St., Oakville, ON, L6K 3C5 ", province: 'ON', 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003002", vsid: "2", vsvendorid: "MORRIS", name: "St. Thomas Optometric Center", address: "208-230 First Avenue, St. Thomas, ON, N5R4P5", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003003", vsid: "3", vsvendorid: "VESPA", name: "Vespa Vision Center", address: "700 Tecumseh Road E, Suite 102, Windsor, ON, N8X4T2", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003004", vsid: "4", vsvendorid: "MCMURTER", name: "Village Eyecare Optometry", address: "54 Wilson Street West, Unit 16, Ancaster , ON, L9G3T8", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003005", vsid: "5", vsvendorid: "MANNING ROAD", name: "Manning Road Optometric Centre", address: "13300 Lanoue, Tecumseh, ON, N8N1E5", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003006", vsid: "6", vsvendorid: "VANYMEREN, GARN", name: "Van Ymeren & Townshend", address: "600 Colborne Street, London, ON, N6B2V2", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003007", vsid: "7", vsvendorid: "SAMUEL", name: "Dr. Warren Samuel Optometry, P.C.", address: "2291 Kipling Avenue, Suite 119, Etobicoke, ON, M9W4L6", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003008", vsid: "8", vsvendorid: "DIPPLE", name: "Dr. Valerie Dippel", address: "77 Water Street North, Kitchener, ON, N2H 5A6", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003009", vsid: "9", vsvendorid: "", name: "Dr. Dawn Clarke", address: "77 Water Street North, Kitchener, ON, N2H5A6", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003010", vsid: "10", vsvendorid: "SALSBERG01", name: "Eyes On Sheppard", address: "180 Sheppard Ave. East, Toronto, ON, M2N3A4", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003011", vsid: "11", vsvendorid: "", name: "Dr. Pavan Avinashi Optometric Corp.", address: "61 Lonsdale Ave., North Vancouver, BC, V7M2E5", 	model_id: 1, province: 'BC', admin: true])
clinic = Clinic.create([ vendorid: "VN0003012", vsid: "12", vsvendorid: "Avinashi", name: "Dr. Pavan Avinashi, Optometric Corp.", address: "1516 Marine Drive, West Vancouver, BC, V7V1H8", 	model_id: 1, province: 'BC', admin: true])
clinic = Clinic.create([ vendorid: "VN0003014", vsid: "14", vsvendorid: "", name: "Dr. Jason Morris Optometry, P.C.", address: "156 Currie Road, Dutton, ON, N0L1J0", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003015", vsid: "15", vsvendorid: "EYE STUDIO", name: "Jason Holtom, Professional Corp. & Tedra Kindopp, Professional Corp.", address: "East Hill Centre 510-3020 22 St., Red Deer, AB, T4R3J5", 	model_id: 1, province: 'AB', admin: true])
clinic = Clinic.create([ vendorid: "VN0003016", vsid: "16", vsvendorid: "VYAS", name: "Dr. Neel Vyas, Optometry, P.C.", address: "822 St. Clair Ave. W, Toronto, ON, M6C1C1", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003017", vsid: "17", vsvendorid: "KAPLAN01", name: "Dr. Michael Kaplan Optometry, Professional Corporation", address: "5 Fairview Mall Drive, Ste. 110, North York, ON, M2J2Z1", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003018", vsid: "18", vsvendorid: "MARKHAM", name: "Markham Optometric Clinic", address: "4997 Highway 7, Unit 110, Markham, ON, L3R1N1", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003019", vsid: "19", vsvendorid: "OPTICON", name: "Dr. C. Tepperman Optometry, P.C.", address: "1409-77 Bloor St. West, Ste. 1409, Toronto, ON, M5S1M2", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003020", vsid: "20", vsvendorid: "THORNBORROW", name: "Dr. D. Thornborrow, Optometry, P.C.", address: "301 Dundas St. E, Waterdown, ON, L0R2H0", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003021", vsid: "21", vsvendorid: "RICHMOND01", name: "Dr. M. Richmond, Optometry, P.C.", address: "301 Dundas St. E, Waterdown, ON, L0R2H0", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003022", vsid: "22", vsvendorid: "WATERDOWN", name: "Waterdown Optometric Clinic", address: "301 Dundas St. E, Waterdown, ON, L0R2H0", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003023", vsid: "23", vsvendorid: "", name: "Jason Morris Optometry, P.C.", address: "1071 Wellington Rd, Ste. 206, London, ON, N6E1W4", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003024", vsid: "24", vsvendorid: "TYBER", name: "Kevin J. Tyber, O.D.", address: "556 Kingston Rd. West, Ajax , ON, L1T3A2 ", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003025", vsid: "25", vsvendorid: "RANDHAWA", name: "Manbir Randhawa, O.D.", address: "2625 East 49th Ave, Vancouver, BC, V5S1J9", 	model_id: 1, province: 'BC', admin: false])
clinic = Clinic.create([ vendorid: "VN0003026", vsid: "26", vsvendorid: "GAGLIARDI1", name: "Dr. Mimmo Gagliardi, Optometrist", address: "8633 Weston Road, Unit 10, Woodbridge, ON, L4L9R6", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003027", vsid: "27", vsvendorid: "GAGLIARDI2", name: "Dr. Mimmo Gagliardi, Optometrist", address: "2100 Finch Ave. West, Ste. 102, North York, ON, M3N2Z9", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003028", vsid: "28", vsvendorid: "KIDDIE", name: "Timothy Kiddie, O.D.", address: "4085 Hamilton Road, Dorchester, ON, N0L1G2", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003029", vsid: "29", vsvendorid: "PAL", name: "Dr. Shalu Pal Optometry Professional Corporation", address: "94 Cumberland St., Ste. 902, Toronto, ON, M5R1A3", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003030", vsid: "30", vsvendorid: "BAUMANSCHROP", name: "Drs. Bauman& Schropp- DBA Old South Optometry", address: "393 Wharncliffe Rd. S, London, ON, N6J2M3", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003032", vsid: "32", vsvendorid: "JARRETT", name: "Dr. Jarrett & Associates", address: "200 University Ave., Ste. 100, Toronto, ON, M5H3C6", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003033", vsid: "33", vsvendorid: "CHATOO", name: "Dr. Sameen Chatoo and Associates", address: "2175 Sheppard Ave., East, Suite 206, Toronto, ON, M2J1W8", 	model_id: 1, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003034", vsid: "34", vsvendorid: "AHOKAS", name: "Kevin Ahokas Optometry Professional Corporation", address: "535 Upper Wellington St., Hamilton, ON, L9A3D7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003036", vsid: "36", vsvendorid: "CHUNG", name: "Drs. Chung & Tse, Optometrists", address: "318 Broadview Ave., Toronto, ON, M4M2G9", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003037", vsid: "37", vsvendorid: "MONTEIRO", name: "Jo-Anne Monteiro & Associates, Optometrists", address: "1960 Appleby Line, Suite 12, Burlington, ON, L7L0B7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003038", vsid: "38", vsvendorid: "MAYERS", name: "1754554 Ontario Limited - Dr. Harvey Mayers", address: "3300 Bloor St. West, Ste 2260, Centre Tower, Etobicoke, ON, M8X2X3", 	model_id: 1, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003040", vsid: "40", vsvendorid: "DUBE", name: "Francis Dube, O.D.", address: "1264 Garrison Rd., Unit 4, Fort Erie, ON, L2A1P1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003041", vsid: "41", vsvendorid: "SHER", name: "Innisfil Eye Care", address: "7975 Yonge St., Unit 14, Innisfil, ON, L9S1L2", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003042", vsid: "42", vsvendorid: "HERSHORN", name: "Dr. Jason Hershorn - St. Clair Optometry", address: "1366 Yonge St., Ste. 103, Toronto, ON, M4T3A7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003043", vsid: "43", vsvendorid: "NELSON", name: "Waverley Eye Care Centre, Inc.", address: "1-1200 Waverly St., Winnipeg, MB, R3T0P4", 	model_id: 2, province: 'MB', admin: true])
clinic = Clinic.create([ vendorid: "VN0003044", vsid: "44", vsvendorid: "GOLE", name: "Yorkview Optometric Clinic", address: "480 Smith St., Arthur, ON, N0G1A0", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003045", vsid: "45", vsvendorid: "GOLE", name: "Dr. Robert D. Gole B.Sc.,O.D - Yorkview Optometric Clinic", address: "1100 A Davis Dr., Ste. 1, Newmarket, ON, L3Y8W8", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003046", vsid: "46", vsvendorid: "PAPADAKIS", name: "Finch Avenue Optometry & Low Vision Clinic", address: "244 Finch Ave., W, Toronto, ON, M2R 1M7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003047", vsid: "47", vsvendorid: "GOLD", name: "Thornhill Optometric Centre", address: "11 Disera Dr., Unit 150, Thornhill, ON, L4J0A7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003048", vsid: "48", vsvendorid: "BAHN", name: "Vi Tu Banh Optometry, Professional Corporation", address: "2 Elgin Park Dr., Unit D, Uxbridge, ON, L9P0B1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003049", vsid: "49", vsvendorid: "KOGON", name: "Dr. Gary Kogon - Missassauga Optometric Clinic", address: "    2  Robert Speck Parkway,  Suite 150 Mississauga, ON, L4Z-1H8", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003050", vsid: "50", vsvendorid: "CHANG", name: "Yih Ling Chang Optometry, P.C.", address: "62 Ellesmere Rd., Scarborough, ON, M1R4C2", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003051", vsid: "51", vsvendorid: "LOWY", name: "Lowy Optometry Professional Corporation", address: "1520 Steeles Ave., W., Ste 120 - A, Concord, ON, L4K3B9", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003052", vsid: "52", vsvendorid: "CHALATURNYK", name: "Dr. T.W. Chalaturnyk & Associates", address: "679 Davis Dr., Unit 321, Newmarket, ON, L3Y5G8", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003053", vsid: "53", vsvendorid: "KAUL", name: "Urban Optik, Ltd.", address: "18328 Lessard Rd., Edmonton, AB, T6M2W8", 	model_id: 2, province: 'ED', admin: false])
clinic = Clinic.create([ vendorid: "VN0003054", vsid: "54", vsvendorid: "WESTFALL or KETTNER", name: "I Sight Optometry", address: "#4-2070 Harvey Ave., Kelowna, BC, VIY8P8", 	model_id: 2, province: 'BC', admin: true])
clinic = Clinic.create([ vendorid: "VN0003055", vsid: "55", vsvendorid: "WONG", name: "Gregory V. Wong, O.D.", address: "50 - 8 Glen Warford Dr., Scarborough, ON, M1S2C1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003056", vsid: "56", vsvendorid: "", name: "T.L. Brodie Optometry Professional Corp.", address: "405 Pearl St. , Burlington, ON, L7R2M8", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003057", vsid: "57", vsvendorid: "NELLES", name: "Dr. Gary Nelles Optometry Professional Corporation", address: "36 Brock St. West, Tillsonburg, ON, N4G2A2", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003058", vsid: "58", vsvendorid: "TRAN", name: "Precision Eye Care", address: "2965 Ellwood Dr., Edmonton, AB, T6X 0B1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003059", vsid: "59", vsvendorid: "PRINZEN", name: "BIlli Jayne Prinzen, O.D.", address: "13380 Loyalist Parkway, Picton, ON, K0K 2T0", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003060", vsid: "60", vsvendorid: "RITCHIE", name: "Dr. Ritchie", address: "51 Water St. North, Cambridge, ON, N1R 3B3", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003061", vsid: "61", vsvendorid: "SMITH", name: "Dr. Smith", address: "51 Water St. North, Cambridge, ON, N1R 3B3", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003062", vsid: "62", vsvendorid: "HALL or HALL&OTHERS", name: "Dr. Hall", address: "51 Water St. North, Cambridge, ON, N1R 3B3", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003063", vsid: "63", vsvendorid: "PETERSON01", name: "Optometry on Hyde Park", address: "1900 Hyde Park Rd., Ste. 5, London, ON, N6H 5L9", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003066", vsid: "66", vsvendorid: "YOSHIMURA", name: "Dr. Mark Yoshimura, Yorkview Vision & Eyecare", address: "3695 Keele St., Ste. 101, Downsview, ON, M3J 1N2", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003067", vsid: "67", vsvendorid: "DIBERARDINO", name: "Orangeville Optometrists", address: "31 First St., Orangeville, ON, L9W 2C8", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003068", vsid: "68", vsvendorid: "SAMUELL01", name: "Mainstreet Optometric", address: "25 Bayfield Main St. North, Bayfield, ON, N0M1G0", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003069", vsid: "69", vsvendorid: "RAHMAN", name: "Dr. Shahreena Rahman", address: "261 Talbot St. West, Aylmer, ON, N5H 1J9", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003070", vsid: "70", vsvendorid: "MCLEOD", name: "Dr. Murray McLeod - DBA Sunningdale Optometry", address: "655 Fanshawe Park Rd. West, Unit 2, London, ON, N6G 5B4", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003071", vsid: "71", vsvendorid: "Maki", name: "James Allan Maki, O.D.", address: "2380 Long Lake Rd., Sudbury, ON, P3E 5H5", 	model_id: 2, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003074", vsid: "74", vsvendorid: "", name: "Dr. Angela Yoon, Optometry Professional Corporation", address: "3030 Lawrence Avenue East, Ste. 106, Scarborough, ON, M1P 2T7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003075", vsid: "75", vsvendorid: "VOISIN", name: "Dr. Linda Voisin Optometry, Profesional Corporation", address: "4997 Highway 7, Unit 110, Markham, ON, L3R 1N1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003076", vsid: "76", vsvendorid: "Moussa", name: "Dr. M. Moussa Optometry Professional Corporation", address: "2682 Tecumseh Rd. E, Windsor, ON, N8W 1G2", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003077", vsid: "77", vsvendorid: "Schuster", name: "Hans C. Schuster, O.D.", address: "22 Market Street South, Brantford, ON, N3S 2E3", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003078", vsid: "78", vsvendorid: "MORLEY", name: "Angela Morley, O.D., P.C.", address: "#1-530 Saint Albert Trail, Saint Albert, AB, T8N 5Z1", 	model_id: 2, province: 'AB', admin: false])
clinic = Clinic.create([ vendorid: "VN0003079", vsid: "79", vsvendorid: "", name: "Shuit Optometry Professional Corporation", address: "640 Wellington St., London, ON, N6A 3R9", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003080", vsid: "80", vsvendorid: "", name: "Dr. Shailinder Bhullar ", address: "101-12827 76 Ave., Surrey, BC, V2W 2V3", 	model_id: 2, province: 'BC', admin: false])
clinic = Clinic.create([ vendorid: "VN0003081", vsid: "81", vsvendorid: "", name: "Dr. Peter Rozanec, Optometric Professional Corporation", address: "228 Lakeshore Rd. W, Ste. 6, Mississauga,, ON, L5H 1G6", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003082", vsid: "82", vsvendorid: "", name: "Dr. Anthony DiPasquale", address: "80 Richmond St., Amherstburg , ON, N9V 1E9", 	model_id: 2, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003083", vsid: "83", vsvendorid: "", name: "Dr. Daniel Rayman Optometry Professional Corporation", address: "9-372 Tower Hill Rd., Richmond Hill, ON, L4E 0T8", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003084", vsid: "84", vsvendorid: "", name: "Amany Wissa, Professional Optometric Incoporation", address: "110 Brickyard Way unit 7,  Brampton, ON, L6V 4N1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003085", vsid: "85", vsvendorid: "", name: "Dr. Shanthy Sandrasekaramudaly Brown", address: "3351 Markham Rd., Unit A125, Scarborough, ON, M1X0A6 ", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003086", vsid: "86", vsvendorid: "", name: "Shea Colpitts, O.D.", address: "213-4368 Main St., Whistler, BC, V0N 1B4", 	model_id: 2, province: 'BC', admin: false])
clinic = Clinic.create([ vendorid: "VN0003087", vsid: "87", vsvendorid: "", name: "Drs. A Y.C. Wong, C. Shum, J.C. Ng, Optometric Corporation", address: "4657 Lougheed Highway Unit 51, Burnaby, BC, V5C 3Z6", 	model_id: 2, province: 'BC', admin: false])
clinic = Clinic.create([ vendorid: "VN0003088", vsid: "88", vsvendorid: "", name: "Drs. Anthony Y.C. Wong and Cindy Shum, Optometric Corporation", address: "B-369 Dollarton Highway North, North Vancouver, BC, V7G 1N9", 	model_id: 2, province: 'BC', admin: false])
clinic = Clinic.create([ vendorid: "VN0003089", vsid: "89", vsvendorid: "", name: "2098446 Ontario Ltd.", address: "360 Manning Road, Tecumseh , ON, N8N 5E1", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003090", vsid: "90", vsvendorid: "AVINASHI", name: "Dr. Pavan Avinashi, Optometric Corporation", address: "301 E. Columbia St., Ste. 108-301, New Westminster, BC, V3L 3W5", 	model_id: 2, province: 'BC', admin: true])
clinic = Clinic.create([ vendorid: "VN0003091", vsid: "91", vsvendorid: "", name: "Dr. Daniel Rayman Optometry Professional Corporation", address: "23 King St. W., Box 604, Bolton, ON, L7E 5T5", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003092", vsid: "92", vsvendorid: "", name: "Dr. Daniel Do Optometry P.C.  DBA:  Kingsway Eye Care Family Optometry", address: "3070 Bloor St. West, Etobicoke, ON, M8X 1C4", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003093", vsid: "93", vsvendorid: "", name: "Dr. Vernon Prentice Optometry Professional Corporation", address: "481 MacKay St., Pembroke, ON, K8A 1E5", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003094", vsid: "94", vsvendorid: "", name: "Dianne Powell, O.D.", address: "20 Kingsbridge Garden circle, Ste. 2002, Mississauga, ON, L5R 3K7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003095", vsid: "95", vsvendorid: "", name: "vs.eye.Optometry, Inc.", address: "102-18640 Fraser Hwy., Surrey, BC, V3S 7Y4", 	model_id: 2, province: 'BC', admin: false])
clinic = Clinic.create([ vendorid: "VN0003096", vsid: "96", vsvendorid: "", name: "Dr. Chris Schell Optometry Professional Corporation", address: "225 Ferndale Drive South, Unit 6, Barrie, ON, L4N 6B9", 	model_id: 2, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003097", vsid: "97", vsvendorid: "", name: "Dre D. Frigault Optometrie Societe Professionnelle", address: "1624 Laurier St., Clarence-Rockland, ON, K4K 1M5", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003098", vsid: "98", vsvendorid: "", name: "Alyssa E. Markowitz, Optometry Professional Corporation", address: "1370 Dundas St. E, Mississauga, ON, L4Y 4G4", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003099", vsid: "99", vsvendorid: "", name: "Alyssa E. Markowitz, Optometry Professional Corporation", address: "1209 King St. W, Unit 3, Toronto, ON, M6K 1G2", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003100", vsid: "100", vsvendorid: "", name: "Laurin Optometry Professional Corporation", address: "2828 St. Joseph Blvd., Orleans , ON, K1C 1G7 ", 	model_id: 2, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003101", vsid: "101", vsvendorid: "", name: "Laurin Optometry Professional Corporation", address: "178 Beechwood Ave, Ottawa, ON, K1M 1A9", 	model_id: 2, province: 'ON', admin: true])
clinic = Clinic.create([ vendorid: "VN0003102", vsid: "102", vsvendorid: "", name: "Brian C. Blake, O.D.", address: "2629 Howard Ave, Unit B Devon Plaza, Windsor, ON, N8X 4Z3", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003103", vsid: "103", vsvendorid: "", name: "Chong-hwa Michael Shin, O.D.", address: "138 - 7181 Yonge St., Thornhill, ON, L3T 0C7", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003104", vsid: "104", vsvendorid: "", name: "Pickering Optometric Clinic DBA: Oshawa Optometric Centre", address: "128-419 King St. W, Oshawa, ON, L1J 2K5", 	model_id: 2, province: 'ON', admin: false])
clinic = Clinic.create([ vendorid: "VN0003105", vsid: "105", vsvendorid: "", name: "Pickering Optometric Clinic  DBA:  Pickering Optometric Clinic", address: "212-1885 Glenanna Road, Pickering, ON, L1V 6R6", 	model_id: 2, province: 'ON', admin: false]) 
MembershipFee.delete_all