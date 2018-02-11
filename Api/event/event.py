from sqlalchemy import Column,String,Integer,Date,BigInteger,Boolean,DateTime,ForeignKey,func
from base import Base
class Event(Base):
	__tablename__='userevent'
	usereventid=Column(BigInteger,primary_key=True,autoincrement=True)
	useraccountid=Column(BigInteger,ForeignKey('useraccount.useraccountid'))
	eventname = Column(String(200))
	createddatetime=Column(DateTime,default=func.now())
	startdatetime=Column(DateTime,default=func.now())
	enddatetime = Column(DateTime,default=func.now())
	locationname = Column(String(200),default=' ')
	locationaddress = Column(String(200),default=' ')
	locationcity = Column(String(500),default=' ')
	locationcoordinate = Column(String(200),default=' ')
	capacity = Column(Integer,default=0)
	rangefeefrom = Column(Integer,default=0)
	rangefeeto = Column(Integer,default=0)
	eventtag = Column(String(200),default=' ')
	ispublic =  Column(Boolean,default=True)
	
	# def __init__(self,eventname,createdatetime,startdatetime,enddatetime,locationname,locationaddress,locationcity,locationcoordinate,capacity,rangefeefrom,rangefeeto,eventtag,ispublic):
		# self.eventname=eventname
		# self.createdatetime=createdatetime
		# self.startdatetime=startdatetime
		# self.enddatetime=enddatetime
		# self.locationname=locationname
		# self.locationaddress=locationaddress
		# self.locationcity=locationcity
		# self.locationcoordinate=locationcoordinate
		# self.capacity=capacity
		# self.rangefeefrom=rangefeefrom
		# self.rangefeeto=rangefeeto
		# self.eventtag=eventtag
		# self.ispublic=ispublic