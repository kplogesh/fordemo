<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="top.css">
    <link rel="stylesheet" type="text/css" href="webMethods.css">
	<style>
		.blk {
           -moz-animation-duration: 800ms;
           -moz-animation-name: blink;
           -moz-animation-iteration-count: infinite;
           -moz-animation-direction: alternate;
           
           -webkit-animation-duration: 800ms;
           -webkit-animation-name: blink;
           -webkit-animation-iteration-count: infinite;
           -webkit-animation-direction: alternate;
           
           animation-duration: 800ms;
           animation-name: blink;
           animation-iteration-count: infinite;
           animation-direction: alternate;
         }
         @-moz-keyframes blink {
           from { background-color: green; }
           to { background-color: inherit; }
         }
         
         @-webkit-keyframes blink {
           from { background-color: green; }
           to { background-color: inherit; }
         }
         
         @keyframes blink {
           from { background-color: green; }
           to { background-color: inherit; }
         }
	</style>
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
<br>
<table width="100%" border="1" height="100%" id="podtable">
	<trclass="toptittlerow">
		<td colspan="5" class="toptitle" align="center"><h2>&nbsp;Pod Details
		%ifvar participantName -notempty%
			&nbsp;- Showing for %value participantName encode(html)%
		%endif%
		</h2></td>
	</tr>
	%invoke KubernetesDemo.services:getRuntimePodClassifications%
	<tr>
		<td width="20%" align="center" valign="top"><br>
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:orange"><h4>Micro Services Runtime - Feedback Capture</h4></td>
				</tr>
				%ifvar classifications/msr/capture -notempty%
					%loop classifications/msr/capture%
							%ifvar matchhost equals('true')%
							<tr>
								<td class="blk" width="75%"><br>%value name encode(html)%<br><br></td>
								<td class="blk" width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%else%
							<tr>
								<td width="75%"><br>%value name encode(html)%<br><br></td>
								<td width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%endif%
					%endloop%
				%else%
							<tr>
								<td colspan="2" align="center"><br><font color="red"><h4>Pods does not exist</h4></font><br><br></td>
							</tr>
				%endif%
			</table>
		</td>
		<td width="20%" align="center" valign="top"><br>  
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:blue"><h4>Universal Messaging</h4></td>
				</tr>
				%ifvar classifications/umserver -notempty%
					%loop classifications/umserver%
							%ifvar matchhost equals('true')%
							<tr>
								<td class="blk" width="75%"><br>%value name encode(html)%<br><br></td>
								<td class="blk" width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%else%
							<tr>
								<td width="75%"><br>%value name encode(html)%<br><br></td>
								<td width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%endif%
					%endloop%
				%else%
							<tr>
								<td colspan="2" align="center"><br><font color="red"><h4>Pods does not exist</h4></font><br><br></td>
							</tr>
				%endif%
			</table>
		</td>
		<td width="20%" align="center" valign="top"><br>
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:yellow"><h4>Micro Services Runtime - Feedback Processor</h4></td>
				</tr>
				%ifvar classifications/msr/processor -notempty%
					%loop classifications/msr/processor%
							%ifvar matchhost equals('true')%
							<tr>
								<td class="blk" width="75%"><br>%value name encode(html)%<br><br></td>
								<td class="blk" width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%else%
							<tr>
								<td width="75%"><br>%value name encode(html)%<br><br></td>
								<td width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%endif%
					%endloop%
				%else%
							<tr>
								<td colspan="2" align="center"><br><font color="red"><h4>Pods does not exist</h4></font><br><br></td>
							</tr>
				%endif%
			</table>
		</td>
		<td width="20%" align="center" valign="top"><br>
			<table border="1" width="90%">
				<tr class="toptittlerow">
					<td  colspan="2" align="center" style="background-color:green"><h4>Terracotta</h4></td>
				</tr>
				%ifvar classifications/terracotta -notempty%
					%loop classifications/terracotta%
							%ifvar matchhost equals('true')%
							<tr>
								<td class="blk" width="75%"><br>%value name encode(html)%<br><br></td>
								<td class="blk" width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%else%
							<tr>
								<td width="75%"><br>%value name encode(html)%<br><br></td>
								<td width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%endif%
					%endloop%
				%else%
							<tr>
								<td colspan="2" align="center"><br><font color="red"><h4>Pods does not exist</h4></font><br><br></td>
							</tr>
				%endif%
			</table>		
		</td>
		<td width="20%" align="center" valign="top"><br>
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:#FF0000"><h4>Micro Services Runtime - Feedback Results</h4></td>
				</tr>
				%ifvar classifications/msr/results -notempty%
					%loop classifications/msr/results%
							%ifvar matchhost equals('true')%
							<tr>
								<td class="blk" width="75%"><br>%value name encode(html)%<br><br></td>
								<td class="blk" width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%else%
							<tr>
								<td width="75%"><br>%value name encode(html)%<br><br></td>
								<td width="25%" align="center"><br>%value status encode(html)%<br><br></td>
							</tr>
							%endif%
					%endloop%
				%else%
							<tr>
								<td colspan="2" align="center"><br><font color="red"><h4>Pods does not exist</h4></font><br><br></td>
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
