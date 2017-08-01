package paidtimeoff.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="t_pto")
public class PaidTimeOff implements Serializable{

	public PaidTimeOff() {
		
	}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private int employeeID;
	@Temporal(TemporalType.TIMESTAMP)
	private Date fromDate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date toDate;
	private int duration;
	private String pojectKey;
	private String projectName;
	private String status;
	private String comments;
	
	
	public PaidTimeOff(int employeeID, String name,Date fromDate, Date toDate, int duration, String pojectKey, String projectName,
			String status, String comments) {
		super();
		this.employeeID = employeeID;
		this.name=name;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.duration = duration;
		this.pojectKey = pojectKey;
		this.projectName = projectName;
		this.status = status;
		this.comments = comments;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "PaidTimeOff [employeeID=" + employeeID + ",name="+name+" , fromDate=" + fromDate + ", toDate=" + toDate + ", duration="
				+ duration + ", pojectKey=" + pojectKey + ", projectName=" + projectName + ", status=" + status
				+ ", comments=" + comments + "]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public int getemployeeID() {
		return employeeID;
	}
	public void setemployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public Date getfromDate() {
		return fromDate;
	}
	public void setfromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date gettoDate() {
		return toDate;
	}
	public void settoDate(Date toDate) {
		this.toDate = toDate;
	}
	public int getduration() {
		return duration;
	}
	public void setduration(int duration) {
		this.duration = duration;
	}
	public String getpojectKey() {
		return pojectKey;
	}
	public void setpojectKey(String pojectKey) {
		this.pojectKey = pojectKey;
	}
	public String getprojectName() {
		return projectName;
	}
	public void setprojectName(String projectName) {
		this.projectName = projectName;
	}
	public String getstatus() {
		return status;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	public String getcomments() {
		return comments;
	}
	public void setcomments(String comments) {
		this.comments = comments;
	}
	
}