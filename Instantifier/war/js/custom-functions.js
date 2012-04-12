function trim(str) {
    str = str.replace(/^\s+/, '');
    for (var i = str.length - 1; i >= 0; i--) {
        if (/\S/.test(str.charAt(i))) {
            str = str.substring(0, i + 1);
            break;
        }
    }
    return str;
}
 
jQuery.fn.dataTableExt.oSort['uk_date-asc']  = function(a,b) {
    var ukDatea = a.split('/');
    var ukDateb = b.split('/');
     
    var x = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
    var y = (ukDateb[2] + ukDateb[1] + ukDateb[0]) * 1;
     
    return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};
 
jQuery.fn.dataTableExt.oSort['uk_date-desc'] = function(a,b) {
    var ukDatea = a.split('/');
    var ukDateb = b.split('/');
     
    var x = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
    var y = (ukDateb[2] + ukDateb[1] + ukDateb[0]) * 1;
     
    return ((x < y) ? 1 : ((x > y) ?  -1 : 0));
};


function ellipsis(text, n) {
    if(text.length>n)
        return text.substring(0,n)+"...";
    else
        return text;
} 

function editRow(){
	
}

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
	    		    {paramOne : 1, name : anSelected[0].cells[1].innerText}
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
	    var formattedDate =  ((''+day).length<2 ? '0' : '') + day + '/' +
	        ((''+month).length<2 ? '0' : '') + month + '/' + d.getFullYear();
	    
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
		                                         "",
		                             		    data,
		                             		    "",
		                             		    "",
		                             		    "",
		                             		   formattedDate]
		                             		  );   
		  
        }
      });
    }