

$( document ).ready(function() {
	$( "select" ).change(function() {
		$("body .system").empty();
		$("body .details").hide();
	  	// console.log($(this).val());
	  	var selectId = $(this).val();
	  	// ajaxFunctionSelectSystem(selectId);
	  	if(selectId != '0'){
	  		ajaxFunctionSelectSystem(selectId);
	  	}
	});

	$('body').on('click', 'ul li', function (){
        $("body .details .image_div").empty();
        $('.details').fadeIn();
        var productId = $(this).attr('data-product-id');
        var groupId = $(this).parent().parent().attr('id');
        // console.log(productId);
        // console.log(groupId);
        ajaxFunctionChooseProduct(productId, groupId);
    });
	$("#myForm").submit(function(e) {
			e.preventDefault();
            data = $("form").serialize();
            $.ajax({
              type: "POST",
              url: "updateproductname.php", //Relative or absolute path to mailer.php file
              data: data,
              success: function(data) {
				incomingData = JSON.parse(data);
				$.each(incomingData, function(key,value) {
					$id = value[0];
					$name = value[1];
				});
				alert('success -> entityTypeId ' + $id +' was updated with name: '+ $name);
              }
            });
            return false;
     });
});

function ajaxFunctionSelectSystem(selectId){
	$.ajax("selectsystem.php", {
	  type: "GET",
	  data:{id:selectId,},
	  success: function(data) {
	  	// console.log(data);
		incomingData = JSON.parse(data);
		var valueflag = "1";
		$.each(incomingData, function(key,value) {
			// console.log(value);
            if(value['systemId'] == selectId){
            	var valueGroupId = value['groupId'];
            	var innerHtml = "<div id="+valueGroupId+"></div>";
            	if(valueflag == "1" || valueflag != value['name']){
            		$("body .system").append(innerHtml);
            		$("body .system #"+valueGroupId).append( "<div data-group-id="+value['groupId']+">"+value['name']+"</div>" );
            		valueflag = value['name'];
            	}
            	$("body .system #"+valueGroupId).append( "<ul><li data-product-id="+value['entityTypeId']+">"+value['entityName']+"</li></ul>" );
        		// var EntityTypes = value['EntityTypes'];
          //   	$.each(EntityTypes, function(key,value) {
          //   		// console.log(value);
        		// 	$("body .system #"+valueGroupId).append( "<ul><li data-product-id="+value['_entityTypeId']+">"+value['_name']+"</li></ul>" );
          //   	});
            }
		});
	  },
	  error: function(req, status, err) {
	    //console.error("Something went wrong! Status: %s (%s)", status, err);
	  }
	});
}

function ajaxFunctionChooseProduct(productId, groupId){
	$.ajax("selectproduct.php", {
	  type: "GET",
	  data:{productId:productId,groupId:groupId},
	  success: function(data) {
	    incomingData = JSON.parse(data);
	    // console.log(incomingData);
		$.each(incomingData, function(key,value) {
            if(value['groupId'] == groupId){
            	$('#systemId').val(value['systemId']);
            	$('#group').val(value['name']);
				$('#name').val(value['entityName']);
				$('#id').val(value['entityTypeId']);
				var Icon = value['iconName'];
				// console.log(Icon);
				$("body .details .image_div").append( "<img src=icons/"+Icon+">" );
            }
		});
	  },
	  error: function(req, status, err) {
	    //console.error("Something went wrong! Status: %s (%s)", status, err);
	  }
	});
}
