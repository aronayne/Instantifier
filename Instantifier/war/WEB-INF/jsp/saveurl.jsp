<jsp:useBean id="message" scope="request" type="java.lang.String"/>
<html>
<head>
  <title>Instantifier</title>
  
  <style type="text/css">
@import url("css/style.css");
@import url("css/complete.css");
</style>
  
  <script type="text/javascript" src="js/jquery-1.7.js"></script>
  <script type="text/javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.jeditable.js"></script>
      <script type="text/javascript" src="js/jquery.validate.js"></script>
            <script type="text/javascript" src="js/jquery.dataTables.editable.js"></script>
           <script type="text/javascript" src="js/jquery-ui.js"></script>
           
  <script type="text/javascript">
  
  $(document).ready(function() {
      
  	$('#urlDetailsTable').dataTable({
          sPaginationType: "full_numbers"
      }).makeEditable({
          sDeleteURL: "deleterow"
      });    	  	  
  		  	  
       $.ajax({
          url: 'getallurls',
          data: ({urlVal : $('#urlVal').val()}),
          success: function(data) {
          var jsonObj = jQuery.parseJSON(data);            
          for(var i=0;i<jsonObj.nodes.length;i++){
              var obj = jsonObj.nodes[i];
      		$('#urlDetailsTable').dataTable().fnAddData( [
												"<a href="+obj.url+">"+obj.url+"<a/>",
    		                             		    "",
    		                             		    "",
    		                             		    "",
    		                             		 	obj.date]
    		                             		  );   
          }
          }
        });
  	});
  
  function deleteRow(){
	  
	     var oTable = $('#urlDetailsTable').dataTable();     
	     // Immediately remove the first row
	     
	     var anSelected = fnGetSelected( oTable );
	     
	     oTable.fnDeleteRow( anSelected[0] );
	     
	     //anSelected[0] is of type HTMLTableRowElement - http://krook.org/jsdom/HTMLTableRowElement.html
	     //cells[0] is of type - http://krook.org/jsdom/HTMLTableCellElement.html
	    // alert(anSelected[0].cells[0].innerText);
	     
	     $.get(
	    		    "removeData",
	    		    {paramOne : 1, name : anSelected[0].cells[0].innerText}
/* 	    		    ,function(data) {
	    		       alert('page content: ' + data);
	    		    } */
	    		);

  }
  
  function fnGetSelected( oTableLocal )
  {
  	var aReturn = new Array();
  	var aTrs = oTableLocal.fnGetNodes();
  	
  	for ( var i=0 ; i<aTrs.length ; i++ )
  	{
  		if ( $(aTrs[i]).hasClass('row_selected') )
  		{
  			aReturn.push( aTrs[i] );
  		}
  	}
  	return aReturn;
  }
  
  function getCurrentDate(){
	    var d = new Date();
	    var month = d.getMonth()+1;
	    var day = d.getDate();
	    var formattedDate = d.getFullYear() + '/' +
	        ((''+month).length<2 ? '0' : '') + month + '/' +
	        ((''+day).length<2 ? '0' : '') + day;
	    
	    return formattedDate;
  }
  
    function addUrlAjax() {
    $('#addUrlTable > tbody:last').append('<td id = \'myTD\'><img src=\'/images/ajax-loader.gif\'/></td>');

	var formattedDate = getCurrentDate();
    
      $.ajax({
        url: 'addUrl',
        data: ({urlVal : $('#urlVal').val() , date : formattedDate}),
        success: function(data) {
     	$('#myTD').remove();

		$('#urlDetailsTable').dataTable().fnAddData( [					
		                             		    data,
		                             		    "",
		                             		    "",
		                             		    "",
		                             		   formattedDate]
		                             		  );   
		  
        }
      });
    }
    
  </script>
</head>
<body>
${message}

<!--  
<button id="demo" onclick="doAjax()" title="Button">Get the time!</button>
<div id="time">
</div>
-->
<center>

<table id="addUrlTable">
<td>
<input type="text" id="urlVal"  >
</td>
<td>
<button id="addUrlButton" onclick="addUrlAjax()" title="Button">AddUrl</button>
</td>
</table>
<button id="btnDeleteRow" onclick="deleteRow()" >Delete</button>
<table cellpadding="0" cellspacing="0" border="0" id="urlDetailsTable" class="pretty">
	<thead>
		<tr>
			<th>URI</th>
			<th>Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Date Added</th>
		</tr>
	</thead>
	<tbody>

	</tbody>
	<tfoot>
		<tr>
			<th>URI</th>
			<th>Name</th>
			<th>Description</th>
			<th>Category</th>
			<th>Date Added</th>
		</tr>
	</tfoot>
</table>

</center>


</body>
</html>