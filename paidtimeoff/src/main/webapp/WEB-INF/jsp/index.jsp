<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>PTO | Home</title>

<!-- Bootstrap -->
<link href="../../static/css/bootstrap.min.css" rel="stylesheet">
<link href="../../static/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="../../static/Ionicons/css/ionicons.min.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Personal Time Off</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-pto">Request PTO</a></li>
					<li><a href="all-ptos">Manage PTO's</a></li>
					
					<li><form action="/logout" method="post" enctype="multipart/form-data" class="text-center">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button type="Submit" class="btn btn-link navbar-btn navbar-link">
    Log Out
  </button>
	</form></li>
					
				</ul>	
				
			</div>
					
				
			</div>
		</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
		
			<div class="container" id="homeDiv">
			<div class="text-center">
				<h1>Can i take PTO?</h1>
			</div>
			</div>
			<div class="row">
			<div class="col-md-6 text-center">
			<div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Leave Balance</h3>

            </div>
            <div class="box-body">
              <canvas id="pieChart" style="height:250px"></canvas>
            </div>
            <!-- /.box-body -->
          </div>
          </div>
          <div class="col-md-6 text-center">
            <!-- BAR CHART -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Leaves Availed</h3>

              
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barChart" style="height:230px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          
          </div>
		</c:when>
		<c:when test="${mode == 'MODE_TASK'}">
		
		<div class="container text-center" id="taskDiv">
		<h3>PTO's Pending for Approval</h3>
		<hr>
		<div class="table-responsive">
			<table class="table table-striped table-bordered text-left">
				<thead>
					<tr>
						<th>id</th>
						<th>Name</th>
						<th>employeeID</th>
						<th>fromDate</th>
						<th>toDate</th>
						<th>duration</th>
						<th>status</th>
						<th>comments</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pto" items="${ptos}">
						<tr>
							<td>${pto.id}</td>
							<td>${pto.name}</td>
							<td>${pto.employeeID}</td>
							<td>${pto.fromDate}</td>
							<td>${pto.toDate}</td>
							<td>${pto.duration}</td>
							<td>${pto.status}</td>
							<td>${pto.comments}</td>
							<td><a href="update-pto?id=${pto.id}"><span class="glyphicon glyphicon-pencil"></span></a> </td>
							<td><a href="delete-pto?id=${pto.id}"><span class="glyphicon glyphicon-trash"></span></a> </td>
							
						</tr>
					</c:forEach>
				</tbody>

			</table>

		</div>
	</div>
		
		</c:when>
		<c:when test="${mode == 'MODE_NEW' ||mode == 'MODE_UPDATE'}">
			
			<div class="container text-center ">
				<h3>PTO Form</h3>
				<form class="form-horizontal" method="post" action="save-pto" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="id" value="${pto.id}" />
					<div class="form-group">
						<label class="control-label col-md-4">Name</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="name" value="${pto.name}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">EmployeeID</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="employeeID" value="${pto.employeeID}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">From Date</label>
						<div class="col-md-3" >
							<input type="text" class="form-control" name="fromDate" value="${pto.fromDate}" id='datepicker'/>
                           
						</div>
							
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">To Date</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="toDate" value="${pto.toDate}" id='datepicker1'/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-4">Duration</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id='duration' name="duration" value="${pto.duration}" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-4">Comments</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="comments" value="${pto.comments}" />
						</div>
					</div>
					
					<div class="form-group">
					
							<label class="control-label col-md-4">Status</label>
						<div class="col-md-3">
							<select class="form-control" id="sel1" name="status" value="${pto.status}">
						    <option>Approve</option>
						    <option>Reject</option>
						    
						  </select>
						</div>
						  
						  
						</div>
					
						<input type="submit" class="btn btn-primary" value="Request"/>
					</div>
				</form>
		
			</div>
		</c:when>
		
	</c:choose>

	
	


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/chart.js/Chart.js"></script>
	<script src="static/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	

<script>

  $(function () {
   
	  /*
	  * Date Picker
	  */
	 
	  
	  
	  
	  /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */
     

    var areaChartData = {
      labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label               : 'Allocated Leaves',
          fillColor           : 'rgba(210, 214, 222, 1)',
          strokeColor         : 'rgba(210, 214, 222, 1)',
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : [2, 2, 2, 2, 2, 2, 2]
        },
        {
          label               : 'Leaves Taken',
          fillColor           : 'rgba(60,141,188,0.9)',
          strokeColor         : 'rgba(60,141,188,0.8)',
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [5, 0, 2, 0, 0, 10, 0]
        }
      ]
    }

  
  //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
   // var ltaken=document.getElementById("duration").value;
    
	var durat=0;
    var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
    var pieChart       = new Chart(pieChartCanvas)
    var PieData        = [
      {
        value    : parseFloat(durat),
        color    : '#f56954',
        highlight: '#f56954',
        label    : 'Leaves Taken'
      },
      {
        value    : 30,
        color    : '#00a65a',
        highlight: '#00a65a',
        label    : 'Total Leaves'
      }
    ]
   
    var pieOptions     = {
      //Boolean - Whether we should show a stroke on each segment
      segmentShowStroke    : true,
      //String - The colour of each segment stroke
      segmentStrokeColor   : '#fff',
      //Number - The width of each segment stroke
      segmentStrokeWidth   : 2,
      //Number - The percentage of the chart that we cut out of the middle
      percentageInnerCutout: 50, // This is 0 for Pie charts
      //Number - Amount of animation steps
      animationSteps       : 100,
      //String - Animation easing effect
      animationEasing      : 'easeOutBounce',
      //Boolean - Whether we animate the rotation of the Doughnut
      animateRotate        : true,
      //Boolean - Whether we animate scaling the Doughnut from the centre
      animateScale         : false,
      //Boolean - whether to make the chart responsive to window resizing
      responsive           : true,
      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio  : true,
      //String - A legend template
      
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    pieChart.Doughnut(PieData, pieOptions)
    
	var barChartCanvas                   = $('#barChart').get(0).getContext('2d')
    var barChart                         = new Chart(barChartCanvas)
    var barChartData                     = areaChartData
    barChartData.datasets[1].fillColor   = '#00a65a'
    barChartData.datasets[1].strokeColor = '#00a65a'
    barChartData.datasets[1].pointColor  = '#00a65a'
    var barChartOptions                  = {
      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
      scaleBeginAtZero        : true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines      : true,
      //String - Colour of the grid lines
      scaleGridLineColor      : 'rgba(0,0,0,.05)',
      //Number - Width of the grid lines
      scaleGridLineWidth      : 1,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines  : true,
      //Boolean - If there is a stroke on each bar
      barShowStroke           : true,
      //Number - Pixel width of the bar stroke
      barStrokeWidth          : 2,
      //Number - Spacing between each of the X value sets
      barValueSpacing         : 5,
      //Number - Spacing between data sets within X values
      barDatasetSpacing       : 1,
      //String - A legend template
   
      //Boolean - whether to make the chart responsive
      responsive              : true,
      maintainAspectRatio     : true
    }

    barChartOptions.datasetFill = false
    barChart.Bar(barChartData, barChartOptions)
  
  })
  
 // $('#datepicker').datepicker({
   //   autoclose: true
   // })
    
   // $('#datepicker1').datepicker({
     // autoclose: true
    //})
    
    $('#datepicker').datepicker({
    format: "dd-M-yy",
    todayHighlight:'TRUE',
    autoclose: true,
    minDate: 0,
    maxDate: '+1Y+6M'
}).on('changeDate', function (ev) {
        $('#datepicker1').datepicker('setStartDate', $("#datepicker").val());
});
$('#datepicker1').datepicker({
    format: "dd-M-yy",
    todayHighlight:'TRUE',
    autoclose: true,
    minDate: '0',
    maxDate: '+1Y+6M'
}).on('changeDate', function (ev) {
        var start = $("#datepicker").val();
        var startD = new Date(start);
        var end = $("#datepicker1").val();
        var endD = new Date(end);
        var diff = parseInt((endD.getTime()-startD.getTime())/(24*3600*1000));
        $("#duration").val(diff);
});
    
    

  
</script>



</body>
</html>