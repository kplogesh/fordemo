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
%invoke KubernetesDemo.services:getRuntimePodClassifications%

<table width="100%" border="1" height="100%">
	<trclass="toptittlerow">
		<td colspan="5" class="toptitle" align="center"><h2>&nbsp;Pod Details</h2></td>
	</tr>
	<tr>
		<td width="20%" align="center"><br>
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:orange"><h4>Micro Services Runtime - Feedback Capture</h4></td>
				</tr>
				%loop classifications/msr/capture%
				<tr>
					<td><br>%value ClientID name(html)%<br><br></td>
					<td><br>%value ClientID status(html)%<br><br></td>
				</tr>
				%endloop%
			</table>
		</td>
		<td width="20%" align="center"><br>  
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:blue"><h4>Universal Messaging</h4></td>
					</tr>
				<tr>
					<td><br>Pod 1<br><br></td>
				</tr>
				<tr>
					<td><br>Pod 2<br><br></td>
				</tr>
				<tr>
					<td><br>Pod 3<br><br></td>
				</tr>
			</table>
		</td>
		<td width="20%" align="center"><br>
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:yellow"><h4>Micro Services Runtime - Feedback Processor</h4></td>
				</tr>
				<tr>
					<td><br>Pod 1<br><br></td>
				</tr>
				<tr>
					<td><br>Pod 2<br><br></td>
				</tr>
				<tr>
					<td><br>Pod 3<br><br></td>
				</tr>
			</table>
		</td>
		<td width="20%" align="center"><br>
			<table border="1" width="90%">
				<tr class="toptittlerow">
					<td  colspan="2" align="center" style="background-color:green"><h4>Terracotta</h4></td>
				</tr>
				<tr>
					<td><br>Pod 1<br><br></td>
				</tr>
				<tr>
					<td valign="middle"><br>Pod 2<br><br> 
					</td> 
				</tr>
				<tr>
					<td><br>Pod 3<br><br></td>
				</tr>
			</table>		
		</td>
		<td width="20%" align="center"><br>
			<table border="1" width="90%">
				<tr>
					<td  colspan="2" align="center" style="background-color:#FF0000"><h4>Micro Services Runtime - Feedback Results</h4></td>
				</tr>
				<tr>
					<td><br>Pod 1<br><br></td>
				</tr>
				<tr>
					<td><br>Pod 2<br><br></td>
				</tr>
				<tr>
					<td><br>Pod 3<br><br></td>
				</tr>
			</table>
		</td>
	</tr>
</body>
</html>
