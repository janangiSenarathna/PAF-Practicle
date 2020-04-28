$(document).ready(function()
{
	if($("#alertSuccess").text().trim()=="")
		{
		  $("#alertSuccess").hide();
		}
	$("#alertError").hide();
});

// SAVE==============================================
$(document).on('click', "#btnSave", function(event)
{
	//Clear alerts--------------------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	//Form Validation---------------------------
	var status = validateAppointmentForm();
	if(status != true)
		{
		  $("#alertError").text(status);
		  $("#alertError").show();
		  return;
		}
	//If valid-----------------------------------
	$("#formAppointment").submit();
			
});

//UPDATE==================================================================================================
$(document).on("click", ".btnUpdate", function(event)
		{
	       $("#hidAppointmentIdSave").val($(this).closest("tr").find('#hidAppointmentIdUpdate').val());
	       $("docId").val($(this).closest("tr").find('td:eq(0)').text());
	       $("pName").val($(this).closest("tr").find('td:eq(1)').text());
	       $("aDate1").val($(this).closest("tr").find('td:eq(2)').text());
	       $("aPlace").val($(this).closest("tr").find('td:eq(3)').text());
		
		});

//Client Model==============================================================================================
function validateAppointmentForm()
{
	//Doctor ID
	if($("#docId").val().trim() == "")
		{
		   return "Insert Doctor ID";
		}
	
	//Name
	if($("#pName").val().trim() == "")
	{
	   return "Insert Patient's Name";
	}
	
	//Date
	if($("#aDate1").val().trim() == "")
	{
	   return "Insert Appointment Date";
	}
	
	//Hospital
	if($("#aPlace").val().trim() == "")
	{
	   return "Insert Hospital Name";
	}
	return true;
}