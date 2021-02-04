<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="top.css">
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="csrf-guard.js"></script>
	
  </head>
<body>

<table width="100%" border="1" height="100%">
	<trclass="toptittlerow">
		<td colspan="4" class="toptitle" align="center"><h2>&nbsp;Questionaire</h2></td>
	</tr>
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
			<input type="submit" id="dsubmit" id="dsubmit">
		</td>
		<td width="35%" align="center"	valign="center">
			<table border="0">
				<tr>
					<td align="center">
						<image src="exclamation.png" alt="exclamation" style="width:25px;height:25px;">
					</td>
					<td>
						You are yet to provide your feedback
					</td>
				</tr>
				<tr>
					<td align="center">
						<image src="tick.png" alt="tick" style="width:40px;height:30px;">
					</td>
					<td>
						Thank you for the submission
					</td>
				</tr>
			</table>
		</td>
	</tr>
</body>
</html>
