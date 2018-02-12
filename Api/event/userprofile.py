from sqlalchemy import Column,String,Integer,Date,BigInteger,Boolean,DateTime,Bytea,ForeignKey,func
from base import Base
class Event(Base):
	__tablename__='userprofile'
	useraccountid=Column(BigInteger,ForeignKey('useraccount.useraccountid'))
	userprofilename = Column(String(200))
	email=Column(String(100))
	phonenumber=Column(String(30))
	createddatetime = Column(DateTime,default=func.now())
	picturepath = Column(String(500))
	picture = Column(BYTEA())
