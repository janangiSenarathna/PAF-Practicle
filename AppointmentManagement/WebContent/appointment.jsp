<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import ="model.Doc" %>
<%
  //Save----------------------------------
  if(request.getParameter("docId")!=null)
  {
	  Doc docObj = new Doc();
	  String stsMsg ="";
	  
	  //Insert-------------------------------------------------------------
	  if(request.getParameter("hidAppointmentIdSave")=="")
	  {
		  stsMsg = docObj.insertDoc(request.getParameter("docId"),
				        request.getParameter("pName"),
				        request.getParameter("aDate1"),
				        request.getParameter("aPlace"));
	  }
	  else//Update--------------------------------------------------------
	  {
		  stsMsg = docObj.updateDoc(request.getParameter("hidAppointmentIdSave"),
				       request.getParameter("docId"),
				       request.getParameter("pName"),
				       request.getParameter("aDate1"),
				       request.getParameter("aPlace"));
	  }
	  
	  session.setAttribute("statusMsg", stsMsg);
  }

//Delete------------------------------------------------------------------
if(request.getParameter("hidAppointmentIdDelete")!=null)
{
	Doc docObj = new Doc();
	String stsMsg = docObj.deleteDoc(request.getParameter("hidAppointmentIdDelete"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Details</title>
<link rel="stylesheet" href="Views/css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/appointment.js"></script>
</head>
<body>
	<div class "container">
       <div class="row">
          <div class="col-6">
             <h1>Appointment Details</h1>
             <form id="formAppointment" name="formAppointment" method="post" action="appointment.jsp">
             Doctor Id:
             <input id="docId" name="docId" type="text" class="form-control form-control-sm">
             <br>Patient Name:
             <input id="pName" name="pName" type="text" class="form-control form-control-sm">
             <br>Date:
             <input id="aDate1" name="aDate1" type="text" class="form-control form-control-sm">
             <br>Hospital:
             <input id="aPlace" name="aPlace" type="text" class="form-control form-control-sm">
             <br>
             <input id="btnSave" name="btnSave" type="button" value="Save" class= "btn btn-primary">
             <input type="hidden" id="hidAppointmentIdSave" name="hidAppointmentIdSave" value="">
             </form>
             
             <div id="alertSuccess" class="alert alert-success">
               <%
                  out.print(session.getAttribute("statusMsg"));
               %>
             </div>
             <div id="alertError" class="alert alert-danger"></div>
             
             <br>
             <%
                Doc docObj = new Doc();
                out.print(docObj.readDoc());
             %>
             </div>
       </div>
   </div>
</body>
</html>