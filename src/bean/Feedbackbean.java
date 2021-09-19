package bean;

public class Feedbackbean {
	
	private String topic,message,satisfaction,username ;
	private int isActive,feedbackid;
	private String mail,name;
	
	public String getName()
	{
		return name;
	}
	public void setName(String m)
	{
		this.name=m;
	}

	public int getFeedbackid()
	{
		return feedbackid;
	}
	public void setFeedbackid(int feedbackid)
	{
		this.feedbackid=feedbackid;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username=username;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail=mail;
	}
	public String getFeedbackTopic()
	{
		return topic;
	}
	public void setFeedbackTopic(String topic)
	{
		this.topic=topic;
	}
	
	public String getFeedbackMessage()
	{
		return message;
	}
	public void setFeedbackMessage(String message)
	{
		this.message=message;
	}

	public String getFeedbackSatisfaction()
	{
		return satisfaction;
	}
	public void setFeedbackSatisfaction(String satisfaction)
	{
		this.satisfaction=satisfaction;
	}
		
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}


}
