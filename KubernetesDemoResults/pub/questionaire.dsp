<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="top.css">
    <link rel="stylesheet" type="text/css" href="webMethods.css">
	<script>  
	function validateform(){  
	var name=document.questionaireform.dname.value;  
	var feedback=document.questionaireform.feedback.value;  
	if (name=='' || feedback==''){  
	  alert("Please provide the details before the submission");  
	  return false;  
	} 		
	}  
	</script>  
  </head>
<body>
<form action="" method="post" id="questionaireform" name="questionaireform" onsubmit="return validateform()">
<table width="100%" border="1" height="100%">
	<trclass="toptittlerow">
		<td colspan="4" class="toptitle" align="center"><h2>&nbsp;Questionaire</h2></td>
	</tr>
	%invoke KubernetesDemo.services:sendParticipantFeedback%
	<tr>
		<td width="30%" align="center">
			<table>
				<tr>
					<td align="center">Your Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" id="dname" name="dname"></td>
				</tr>
			</table>
		</td>
		<td width="30%" align="center" height="60%">  
			<table>
				<tr>
					<td>
						  <p>Please select your option: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
					</td>
					<td><br>
						 <input type="radio" id="extremelysatisfied" name="feedback" value="Extremely Satisfied">
						  <label for="Extremely Satisfied">Extremely Satisfied</label><br><br>
						  <input type="radio" id="satisfied" name="feedback" value="Satisfied">
						  <label for="Satisfied">Satisfied</label><br><br>
						  <input type="radio" id="needsimprovement" name="feedback" value="Needs Improvement">
						  <label for="Needs Improvement">Needs Improvement</label><br><br>
						  <input type="radio" id="bad" name="feedback" value="Bad">
						  <label for="Bad">Bad</label><br><br>
					</td>
				</tr>
			</table>
		</td>
		<td width="5%" align="center">
			<button type="submit" form="questionaireform" value="Submit">Submit</button>
		</td>
		<td width="35%" align="center"	valign="center">
			<table border="0">
				%ifvar rmessage equals('Incomplete')%
				<tr>
					<td align="center">
						<image src="exclamation.png" alt="exclamation" style="width:25px;height:25px;">
					</td>
					<td>
						You are yet to provide your feedback
					</td>
				</tr>
				%endif%
				%ifvar rmessage equals('Completed')%
				<tr>
					<td align="center">
						<image src="tick.png" alt="tick" style="width:40px;height:30px;">
					</td>
					<td>
						Thank you for the submission.
						If you want to change your option, you are welcome to do so.<br><br>
						You have chosen the below:<br> Name: [<b>%value participantfeedbackdetails/name encode(html)%</b>] / Option: <b>[%value participantfeedbackdetails/feedback encode(html)%</b>]
					</td>
				</tr>
				%endif%
			</table>
		</td>
	</tr>
	%onerror%
	<tr>
		<td class="message" colspan="5" valign="middle"><image src="error.gif" alt="error" style="width:40px;height:30px;">&nbsp;Error Occured: %value errorMessage encode(html)%<br></td>
	</tr>
</table>
%endinvoke%
</form>
</body>
</html>
