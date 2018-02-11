import json,falcon
from base import Base,Session,SQLAlchemySessionManager,AlchemyEncoder
from event import Event
from user import User

class EventApi:
	def on_get(self,req,resp,user_id=None):
		limit_=20
		data=json.loads(req.stream.read())
		resp.status=falcon.HTTP_200
		if(user_id==None):
			ret=self.session.query(Event).limit(limit_).all()
			content={
				'data':ret
			}
			resp.body=json.dumps(content,cls=AlchemyEncoder)
		else :
			ret=self.session.query(Event).filter(Event.useraccountid==user_id).limit(limit_).all()
			content={
				'data':ret
			}
			resp.body=json.dumps(content, cls=AlchemyEncoder)
	def on_post(self,req,resp,user_id):	
		resp.status=falcon.HTTP_200
		if(user_id==None):
			resp.status=falcon.HTTP_404
			content={
				'msg':"Method Not Allowed"
			}
			resp.body=json.dumps(content)
		else :
			data=json.loads(req.stream.read())
			event=Event()
			event.useraccountid=user_id
			event.eventname=data['eventname']
			self.session.add(event)
			self.session.commit()
			resp.body=json.dumps(event, cls=AlchemyEncoder)
		
api = falcon.API(middleware=[
    SQLAlchemySessionManager(Session),
])

api.add_route('/events',EventApi())
api.add_route('/{user_id}/events',EventApi())
api.add_route('/{user_id}/events/{event_id}',EventApi())

