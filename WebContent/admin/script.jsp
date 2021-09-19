<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <!-- js placed at the end of the document so the pages load faster -->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-1.8.3.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="resources/js/jquery.scrollTo.min.js"></script>
<script src="resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="resources/js/jquery.sparkline.js"></script>
 
<!--common script for all pages-->
<script src="resources/js/common-scripts.js"></script>    
<script type="text/javascript" src="resources/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="resources/js/gritter-conf.js"></script>

<!--script for this page-->
   <script src="resources/js/sparkline-chart.js"></script>    
<script src="resources/js/zabuto_calendar.js"></script>		
<script type="application/javascript">
	var preloader = document.getElementById("loading");
	function PreLoader()
	{
		preloader.style.display = 'none';
	};

    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });
    
        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event", }
            ]
        });
    });        
    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
</script>

     <!--FROM PARSLEY  -->
<link href="resources/css/parsley.css" rel="stylesheet">
<script src="resources/js/parsley.js" type="text/javascript"></script>

<!-- bootstrap link -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">


<!-- FOR MODAL IN FORMS  -->
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- <script src="://code.jquery.com/jquery-3.3.1.js"></script> -->
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap4.min.js"></script>
<script src="resources/js/dataTables.buttons.min.js"></script>
<script src="resources/js/buttons.bootstrap4.min.js"></script>
<script src="resources/js/jszip.min.js"></script>
<script src="resources/js/pdfmake.min.js"></script>
<script src="resources/js/vfs_fonts.js"></script>
<script src="resources/js/buttons.html5.min.js"></script>
<script src="resources/js/buttons.print.min.js"></script>
<script src="resources/js/buttons.colVis.min.js"></script>

<link href="resources/css/bootstrap1.css" rel="stylesheet">
<link href="resources/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="resources/css/buttons.bootstrap4.min.css" rel="stylesheet">
<script type="application/javascript">

$(document).ready(function() {
    var table = $('#example1').DataTable( {
        lengthChange: false,
        /* buttons: [ 'copy', 'excel', 'pdf', 'colvis' ] */
        buttons: [ 'excel', 'colvis' ]
    } );
 
    table.buttons().container()
        .appendTo( '#example_wrapper .col-md-6:eq(0)' );
} );
</script>


<!-- ONLINE LINK FOR PAGINATION & SEARCH 
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.colVis.min.js"></script>




<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.bootstrap4.min.css" rel="stylesheet">
	 -->