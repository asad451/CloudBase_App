package com.mvc.bean;

public class AssignmentBean {
	 
	 private String moduleTitle;
	 private String moduleCode;
	 private String description;
	 private String duedate;
	 private String un;
	 private java.sql.Timestamp dbSqlTimestamp;
	 
	 
	 public void setModuleCode(String c) {
		 this.moduleCode = c;
	 }
	 
	 public String getModuleCode() {
		 return moduleCode;
	 }

	 public void setModuleTitle(String t) {
		 this.moduleTitle = t;
	 }

	 public void setUn(String u) {
		 this.un = u;
	 }
	 
	 public void setDate(String d) {
		 this.duedate = d;
	 }
	 
	 public void setDateTime(java.sql.Timestamp dT) {
		 this.dbSqlTimestamp = dT;
	 }
	 
	 public String getModuleTitle() {
		 return moduleTitle;
	 }	 
	 
	 public void setDescription(String d) {
		 this.description = d;
	 }
	 
	 public String getDescription() {
		 return description;
	 }

	 public String getUn() {
		 return un;
	 }
	 
	 public String getDate() {
		 return duedate;
	 }
	 
	 public java.sql.Timestamp getDateTime() {
		 return dbSqlTimestamp;
	 }


}