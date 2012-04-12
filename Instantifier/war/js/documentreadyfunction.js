  <script type="text/javascript">

  $(document).ready(function() {
$('div.expandable href').expander({
		    slicePoint:       80,  // default is 100
		    expandPrefix:     ' ', // default is '... '
		    expandText:       '[...]', // default is 'read more'
		    collapseTimer:    5000, // re-collapses after 5 seconds; default is 0, so no re-collapsing
		    userCollapseText: '[^]'  // default is 'read less'
		  });

  	$('#urlDetailsTable').dataTable({
          sPaginationType: "full_numbers",
          
              "bInfo": false,  
              "bFilter": true,
              //change bAutoWidth to true 
              "bAutoWidth": false
      }).makeEditable({
          sDeleteURL: "deleterow"

      });    	  	 
  	//urlDetailsTable_wrapper is the generated id which includes the paging options, just setting the .css on urlDetailsTable will just set the width of the main table 
    $("#urlDetailsTable_wrapper").css("width","80%");
  	
       $.ajax({
          url: 'getallurls',
          data: ({urlVal : $('#urlVal').val()}),
          success: function(data) {
          var jsonObj = jQuery.parseJSON(data);            
          for(var i=0;i<jsonObj.nodes.length;i++){
              var obj = jsonObj.nodes[i];
      		$('#urlDetailsTable').dataTable().fnAddData( [
												"<a href="+obj.url+"><div class=\"expandable\">"+obj.url+"</div></a>",
    		                             		    "",
    		                             		    "",
    		                             		    "",
    		                             		 	obj.date]
    		                             		  );   
          }
          }
        });
	});