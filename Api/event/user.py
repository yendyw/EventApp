from sqlalchemy import Column,String,Integer,Date,BigInteger,Boolean,DateTime,ForeignKey,func

from base import Base
class User(Base):
	__tablename__='useraccount'
	
	useraccountid=Column(BigInteger,primary_key=True,autoincrement=True)
	username=Column(String(50))
	password=Column(String(50))
	
	def __init__(self,username,password):
		self.username=username
		self.password=password