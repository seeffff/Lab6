#LAB6 Python starter code
#imports go here
import _mysql

#code goes here

buffer = "true"



def oneQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="password",db="database")
	db.query("""SELECT * FROM wine;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def twoQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="password",db="database")
	db.query("""SELECT * FROM Funding;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def threeQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="password",db="database")
	db.query("""SELECT * FROM Future;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()
	

def fourQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="password",db="database")
	db.query("""SELECT vineyardID FROM Vineyard WHERE vineyardID not in (select vineyardID from Future)""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	if nR == 0:
		print("""all vineyards have at least 1 funding contract""")
	db.close()

def fiveQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="password",db="database")
	db.query("""SELECT futureID FROM Future WHERE futureID in (select futureID from Funding)""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	if nR == 0:
		print("""all futures have at least 1 funding contract""")
	db.close()
	
while buffer:
	print("""
	0.Exit
	1.See wines
	2.See funding
	3.See future
	4.See if a vineyard has no future contracts
	5.See if a future has funding contracts
	""")
	buffer=input("what would you like to do? ")
	if buffer == 1:
		oneQuery()
	if buffer == 2:
		twoQuery()
	if buffer == 3:
		threeQuery()
	if buffer == 4:
		fourQuery()
	if buffer == 5:
		fiveQuery()

