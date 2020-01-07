package com.xml.utils;

public class TbltemUtils {
	//状态码
		private int status;
		//消息
		private String message;
		public static TbltemUtils ok(int status,String message){
			return new TbltemUtils(status, message);
		}
		public TbltemUtils() {
		}
		public TbltemUtils(int status, String message) {
			this.status = status;
			this.message = message;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		@Override
		public String toString() {
			return "TbltemUtils [status=" + status + ", message=" + message + "]";
		}
		
}
