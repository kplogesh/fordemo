<!DOCTYPE html>
<html>
  <head>
      <title>JavaScript Pie Chart</title>
      <script src="anychart-core.min.js"></script>
      <script src="anychart-pie.min.js"></script>
  </head>
  <body>
    <div id="container" style="width:100%; height: 100%"></div>
    <script>
        <!-- chart code will be here -->
		anychart.onDocumentReady(function() {

		  // set the data
		  var data = [
			  {x: "Extremely Satisfied", value: 5},
			  {x: "Satisfied", value: 3},
			  {x: "Needs Improvement", value: 1},
			  {x: "Bad", value: 1}
		  ];

		  // create the chart
		  var chart = anychart.pie();

		  // set the chart title
		  chart.title("Feedback results for Kubernetes Training");

		  // add the data
		  chart.data(data);

		  // display the chart in the container
		  chart.container('container');
		  chart.draw();

		});
    </script>
  </body>
</html>