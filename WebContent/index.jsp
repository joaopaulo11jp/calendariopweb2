<!DOCTYPE html>
<html>
<head>
	<title>Twitter Bootstrap jQuery Calendar component</title>

	<meta name="description" content="Full view calendar component for twitter bootstrap with year, month, week, day views.">
	<meta name="keywords" content="jQuery,Bootstrap,Calendar,HTML,CSS,JavaScript,responsive,month,week,year,day">
	<meta name="author" content="Serhioromano">
	<meta charset="UTF-8">

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!--<link rel="stylesheet" href="components/bootstrap2/css/bootstrap.css">-->
	<link rel="stylesheet" href="components/bootstrap2/css/bootstrap-responsive.css"> 
	<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/calendar.css">

	<style type="text/css">
.navbar-default {
  background-color: #051b79;
  border-color: #067cd1;
}
.navbar-default .navbar-brand {
  color: #ecf0f1;
}
.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus {
  color: #ddd0eb;
}
.navbar-default .navbar-text {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > a {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
  color: #ddd0eb;
}
.navbar-default .navbar-nav > li > .dropdown-menu {
  background-color: #051b79;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
  color: #ddd0eb;
  background-color: #067cd1;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > .divider {
  background-color: #051b79;
}
.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
  color: #ddd0eb;
  background-color: #067cd1;
}
.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
  color: #ddd0eb;
  background-color: #067cd1;
}
.navbar-default .navbar-toggle {
  border-color: #067cd1;
}
.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
  background-color: #067cd1;
}
.navbar-default .navbar-toggle .icon-bar {
  background-color: #ecf0f1;
}
.navbar-default .navbar-collapse,
.navbar-default .navbar-form {
  border-color: #ecf0f1;
}
.navbar-default .navbar-link {
  color: #ecf0f1;
}
.navbar-default .navbar-link:hover {
  color: #ddd0eb;
}

@media (max-width: 767px) {
  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
    color: #ecf0f1;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #ddd0eb;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #ddd0eb;
    background-color: #067cd1;
  }
}


		.btn-twitter {
			padding-left: 30px;
			background: rgba(0, 0, 0, 0) url(https://platform.twitter.com/widgets/images/btn.27237bab4db188ca749164efd38861b0.png) -20px 6px no-repeat;
			background-position: -20px 11px !important;
		}
		.btn-twitter:hover {
			background-position:  -20px -18px !important;
		}
		#calendario{
			margin-left:-60px;
		}
	
	</style>
</head>
<body>
<header>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
     	CalendárioWeb
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
	
    

        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Usuario <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</header>
<div class="container">
	

	<div class="page-header">

		<div class="pull-right form-inline">
			<div class="btn-group">
				<button class="btn btn-primary" data-calendar-nav="prev">&lt;&lt; Prev</button>
				<button class="btn" data-calendar-nav="today">Today</button>
				<button class="btn btn-primary" data-calendar-nav="next">Next &gt;&gt;</button>
			</div>
			<div class="btn-group">
				<button class="btn btn-warning" data-calendar-view="year">Year</button>
				<button class="btn btn-warning active" data-calendar-view="month">Month</button>
				<button class="btn btn-warning" data-calendar-view="week">Week</button>
				<button class="btn btn-warning" data-calendar-view="day">Day</button>
			</div>
		</div>

		<h3>Março de 2013</h3>
		
	</div>

	<div class="row" id="calendario">
		<div class="span9">
			<div class="cal-context" style="width: 100%;" id="calendar"><div class="cal-row-fluid cal-row-head">
	
		<div class="cal-cell1">Domingo</div>
	
		<div class="cal-cell1">Segunda</div>
	
		<div class="cal-cell1">Terça</div>
	
		<div class="cal-cell1">Quarta</div>
	
		<div class="cal-cell1">Quinta</div>
	
		<div class="cal-cell1">Sexta</div>
	
		<div class="cal-cell1">Sábado</div>
	
</div>
<div class="cal-month-box">
	
		
		<div class="cal-row-fluid cal-before-eventlist">
			<div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-outmonth cal-day-weekend cal-month-first-row">
	<span data-original-title="" class="pull-right" data-cal-date="2013-02-24" data-cal-view="day" data-toggle="tooltip" title="">24</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
	<span data-original-title="" class="pull-right" data-cal-date="2013-02-25" data-cal-view="day" data-toggle="tooltip" title="">25</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
	<span data-original-title="" class="pull-right" data-cal-date="2013-02-26" data-cal-view="day" data-toggle="tooltip" title="">26</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
	<span data-original-title="" class="pull-right" data-cal-date="2013-02-27" data-cal-view="day" data-toggle="tooltip" title="">27</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-outmonth cal-month-first-row">
	<span data-original-title="" class="pull-right" data-cal-date="2013-02-28" data-cal-view="day" data-toggle="tooltip" title="">28</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-01" data-cal-view="day" data-toggle="tooltip" title="">1</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-02" data-cal-view="day" data-toggle="tooltip" title="">2</span>
	
</div>
</div>
		</div>
	
		
		<div class="cal-row-fluid cal-before-eventlist">
			<div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-03" data-cal-view="day" data-toggle="tooltip" title="">3</span>
	
<div style="display: none;" data-cal-week="2013-03-03" id="cal-week-box">Week 10</div></div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-04" data-cal-view="day" data-toggle="tooltip" title="">4</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-05" data-cal-view="day" data-toggle="tooltip" title="">5</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-06" data-cal-view="day" data-toggle="tooltip" title="">6</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-07" data-cal-view="day" data-toggle="tooltip" title="">7</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-08" data-cal-view="day" data-toggle="tooltip" title="">8</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-09" data-cal-view="day" data-toggle="tooltip" title="">9</span>
	
</div>
</div>
		</div>
	
		
		<div class="cal-row-fluid cal-before-eventlist">
			<div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-10" data-cal-view="day" data-toggle="tooltip" title="">10</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-11" data-cal-view="day" data-toggle="tooltip" title="">11</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-12" data-cal-view="day" data-toggle="tooltip" title="">12</span>
	
		<div class="events-list" data-cal-start="1363057200000" data-cal-end="1363143600000">
			
				<a data-original-title="This is information class HUEHUE BRBR" href="http://www.example.com/" data-event-id="1000" data-event-class="event-info" class="pull-left event event-info" data-toggle="tooltip" title=""></a>
			
		</div>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-13" data-cal-view="day" data-toggle="tooltip" title="">13</span>
	
		<div class="events-list" data-cal-start="1363143600000" data-cal-end="1363230000000">
			
				<a data-original-title="This is information class HUEHUE BRBR" href="http://www.example.com/" data-event-id="1000" data-event-class="event-info" class="pull-left event event-info" data-toggle="tooltip" title=""></a>
			
		</div>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-14" data-cal-view="day" data-toggle="tooltip" title="">14</span>
	
		<div class="events-list" data-cal-start="1363230000000" data-cal-end="1363316400000">
			
				<a data-original-title="This is information class HUEHUE BRBR" href="http://www.example.com/" data-event-id="1000" data-event-class="event-info" class="pull-left event event-info" data-toggle="tooltip" title=""></a>
			
		</div>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-15" data-cal-view="day" data-toggle="tooltip" title="">15</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-16" data-cal-view="day" data-toggle="tooltip" title="">16</span>
	
</div>
</div>
		</div>
	
		
		<div class="cal-row-fluid cal-before-eventlist">
			<div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-17" data-cal-view="day" data-toggle="tooltip" title="">17</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-18" data-cal-view="day" data-toggle="tooltip" title="">18</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-19" data-cal-view="day" data-toggle="tooltip" title="">19</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-20" data-cal-view="day" data-toggle="tooltip" title="">20</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-21" data-cal-view="day" data-toggle="tooltip" title="">21</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-22" data-cal-view="day" data-toggle="tooltip" title="">22</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-23" data-cal-view="day" data-toggle="tooltip" title="">23</span>
	
</div>
</div>
		</div>
	
		
		<div class="cal-row-fluid cal-before-eventlist">
			<div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-24" data-cal-view="day" data-toggle="tooltip" title="">24</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-25" data-cal-view="day" data-toggle="tooltip" title="">25</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-26" data-cal-view="day" data-toggle="tooltip" title="">26</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-27" data-cal-view="day" data-toggle="tooltip" title="">27</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-28" data-cal-view="day" data-toggle="tooltip" title="">28</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-inmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-29" data-cal-view="day" data-toggle="tooltip" title="">29</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-30" data-cal-view="day" data-toggle="tooltip" title="">30</span>
	
</div>
</div>
		</div>
	
		
		<div class="cal-row-fluid cal-before-eventlist">
			<div class="cal-cell1 cal-cell" data-cal-row="-day1"><div class="cal-month-day cal-day-inmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-03-31" data-cal-view="day" data-toggle="tooltip" title="">31</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day2"><div class="cal-month-day cal-day-outmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-04-01" data-cal-view="day" data-toggle="tooltip" title="">1</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day3"><div class="cal-month-day cal-day-outmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-04-02" data-cal-view="day" data-toggle="tooltip" title="">2</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day4"><div class="cal-month-day cal-day-outmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-04-03" data-cal-view="day" data-toggle="tooltip" title="">3</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day5"><div class="cal-month-day cal-day-outmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-04-04" data-cal-view="day" data-toggle="tooltip" title="">4</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day6"><div class="cal-month-day cal-day-outmonth">
	<span data-original-title="" class="pull-right" data-cal-date="2013-04-05" data-cal-view="day" data-toggle="tooltip" title="">5</span>
	
</div>
</div>
			<div class="cal-cell1 cal-cell" data-cal-row="-day7"><div class="cal-month-day cal-day-outmonth cal-day-weekend">
	<span data-original-title="" class="pull-right" data-cal-date="2013-04-06" data-cal-view="day" data-toggle="tooltip" title="">6</span>
	
</div>
</div>
		</div>
	
</div>
</div>
		</div>
		<div class="span3">
			<div class="row-fluid">
				
				<label class="checkbox">
					<input value="#events-modal" id="events-in-modal" type="checkbox"> Open events in modal window
				</label>
			</div>

			<h4>Events</h4>
			<small>This list is populated with events dynamically</small>
			<ul id="eventlist" class="nav nav-list"><li><a href="http://www.example.com/">This is information class HUEHUE BRBR</a></li></ul>
		</div>
	</div>

	<div class="clearfix"></div>
	

	<div id="disqus_thread"></div>
	<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

	<div class="modal hide fade" id="events-modal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3>Event</h3>
		</div>
		<div class="modal-body" style="height: 400px">
		</div>
		<div class="modal-footer">
			<a href="#" data-dismiss="modal" class="btn">Close</a>
		</div>
	</div>

</div>
	
</div>
</body>
</html>
