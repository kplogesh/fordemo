<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="top.css">
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="csrf-guard.js"></script>
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
	
  </head>
<body>

<table width="100%" border="1" height="100%">
	<trclass="toptittlerow">
		<td colspan="5" class="toptitle" align="center"><h2>&nbsp;Pod Details</h2></td>
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
</body>
</html>
