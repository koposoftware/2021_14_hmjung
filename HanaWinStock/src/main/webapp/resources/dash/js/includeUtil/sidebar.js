/**
 * 
<style>
.chatDirect{
  position: fixed;
  bottom: 0;
  right: 0;
  width: 300px;
  border: 1px solid gray;
  background-color:white;
}
</style>

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>

 */

sidebarToggle = 1
$("#sidebar-toggle").click(function(){
	if(sidebarToggle == 1){
		$(".light-logo").hide()
		$('#subscribed').hide()		
		sidebarToggle = 2
	}else if(sidebarToggle == 2){
		$(".light-logo").show()
		$('#subscribed').show()
		sidebarToggle = 1
	}
})
function openForm( id , myid ) {
  //document.getElementById("personal-chat").style.display = "block";
  	     newBox =	'<div class="box direct-chat direct-chat-info full-chat-box chatDirect">' +
				'<div class="box-header with-border">  ' +
				  '<h4 class="box-title">' + id+ '</h4>  ' +
				  '	<ul class="box-controls pull-right">  '+
					  '	<li><a class="box-btn-close" href="#" onclick="closeSendingForm(\''+id+'\')></a></li>  '+
						  '<li><a class="box-btn-slide" href="#"></a></li>  '+
					  '	<li><a class="box-btn-fullscreen" href="#"></a></li>  '+
				  '</ul>  '+
			  '	</div>  '+	
			'<div class="box-body" id="sendingchat-'+ id +'"  >' + 
                '<input type="hidden" id="sessionId3" value="">' +
				'<div class="direct-chat-messages" id="direct-chat3">'+
				 '</div>' +
				 '<div class="box-footer">'	+
					 '<div class="input-group">'+
						 '<input type="text" id="chat3" name="message" placeholder="메시지를 작성하세요" class="form-control">'+
						 '<div class="input-group-addon">'+
							 '<div class="align-self-end gap-items">'	+							
								  '<a id="send-msg3" class="publisher-btn" onclick="send3(\''+myid+'\' ,\''+ id +'\' )" >'+
									 '<i class="fa fa-paper-plane"></i>'+
								 '</a>'+
							 '</div>'+
						 '</div>'+
					 '</div>'	+	
				 '</div>'+
			 '</div></div>'	

  $("section[class='content']").append(newBox)

	room = "direct-" + id
 
 	ws = new WebSocket("ws://" + location.host + "/HanaWinStock/account/" + room );
    ws.onopen = function(data){
       //소켓이 열리면 초기화 세팅하기
       console.log('소켓열림');
       console.log('ws : ' + ws.url);
    }    
    ws.onmessage = function(data) {
       //메시지를 받으면 동작
       console.log("msg received")
       var msg = data.data;
       console.log("msg : " +  msg);
	   sessionid = null
       if(msg != null && msg.trim() != ''){
          var d = JSON.parse(msg);
			if (d.type == "getId") {				
				 var si = d.sessionId != null ? d.sessionId : "";
				 if(si != ''){
	                 $("#sessionId3").val(si);
					var d = new Date();
					var option = {
					type: "request",
					sessionId: $("#sessionId3").val(),
					userName: myid,
					room: room,
					msg: "none",
					tier: "none",
					year: String(d.getFullYear()),
					hourMin: String(d.getHours()) + ":" + String(d.getMinutes())}		
					ws.send(JSON.stringify(option))			 
	              }																				
			} else if (d.type == "message") {
				console.log("message put")
				if(d.userName == myid){
					console.log("sending end")
					var newmsg = '<div class="direct-chat-msg clearfix right mb-30">' +
    	                  				'<div class="direct-chat-text">'+
    	                  				'<p>' + d.msg + '</p>'+
    	                  				'<p class="direct-chat-timestamp"><time datetime="'+ d.year+'">'+ d.hourMin +'</time></p>'+
    	                  				'</div></div>';
					$("#direct-chat3").append(newmsg); 						
				}else{
					console.log("receving end")
					var newmsg ='<div class="direct-chat-msg clearfix left">'+    	            	  
 						' <div class="direct-chat-text" style="margin-left:0px;">' +
 						'<p>' + d.msg + '</p>' +
 						'<p class="direct-chat-timestamp"><time datetime="'+  d.year  +'">'+ d.hourMin+'</time></p>' +
 						'</div></div>';    	            	  					    	            	  
            	 $("#direct-chat3").append(newmsg);					
				}
			} else if(d.type=="request"){
				console.log("request sending")
			}
			
			else {
				console.warn("unknown type!")
				console.log(d.type)
				ok = d.type
			}
		}
	}
}


function send3(myid , id){
	 var d = new Date();
      var option ={
         type: "message",
         sessionId : $("#sessionId3").val(),
         userName : myid,
         room : "direct-" + id,
         msg : $("#chat3").val(),
         year : String(d.getFullYear()),
         hourMin : String(d.getHours()) + ":" + String(d.getMinutes())     	   
      }
      console.log(option)
      ws.send(JSON.stringify(option))
      $('#chat3').val("");
}


function send2(myid){
	 var d = new Date();
      var option ={
         type: "message",
         sessionId : $("#sessionId2").val(),
         userName : myid,
         room : "direct-" + myid,
         msg : $("#chat2").val(),
         year : String(d.getFullYear()),
         hourMin : String(d.getHours()) + ":" + String(d.getMinutes())     	   
      }
      console.log(option)
      ws.send(JSON.stringify(option))
      $('#chat2').val("");
}



function closeSendingForm(id){
	$("#sendingchat-" + id).remove()
}


function closeForm(id) {
 	$("#chat-" + id).remove()	
}



function openDirect(myid){
	ws = new WebSocket("ws://" + location.host + "/HanaWinStock/account/direct-" +    myid );
    ws.onopen = function(data){
       //소켓이 열리면 초기화 세팅하기
       console.log('소켓열림');
       console.log('ws : ' + ws.url);
    }    
    ws.onmessage = function(data) {
       //메시지를 받으면 동작
       console.log("msg received")
       var msg = data.data;
       console.log("msg : " +  msg);
       if(msg != null && msg.trim() != ''){
          var d = JSON.parse(msg);
          if(d.type == "getId"){
             var si = d.sessionId != null ? d.sessionId : "";
             if(si != ''){
                $("#sessionId").val(si); 
             }
          }else if(d.type == "request"){
	     newBox =	'<div class="box direct-chat direct-chat-info full-chat-box chatDirect">' +
				'<div class="box-header with-border">  ' +
				  '<h4 class="box-title">' + d.userName+ '</h4>  ' +
				  '	<ul class="box-controls pull-right">  '+
					  '	<li><a class="box-btn-close" href="#" onclick="closeForm(\''+myid+'\')"></a></li>  '+
						  '<li><a class="box-btn-slide" href="#"></a></li>  '+
					  '	<li><a class="box-btn-fullscreen" href="#"></a></li>  '+
				  '</ul>  '+
			  '	</div>  '+	
			'<div class="box-body" id="chat-'+ myid +'"  >' + 
                '<input type="hidden" id="sessionId2" value="">' +
				'<div class="direct-chat-messages" id="direct-chat2">'+
				 '</div>' +
				 '<div class="box-footer">'	+
					 '<div class="input-group">'+
						 '<input type="text" id="chat2" name="message" placeholder="메시지를 작성하세요" class="form-control">'+
						 '<div class="input-group-addon">'+
							 '<div class="align-self-end gap-items">'	+							
								 '<a id="send-msg2" class="publisher-btn"  onclick="send2(\''+myid+'\' )"> '+
									 '<i class="fa fa-paper-plane"></i>'+
								 '</a>'+
							 '</div>'+
						 '</div>'+
					 '</div>'	+	
				 '</div>'+
			 '</div></div>'
  			$("section[class='content']").append(newBox)          			  		 	       		 	         		                 	         		                 	            	  
         }else if(d.type == "message"){
				console.log("message type")
				if(d.userName == myid){
					console.log("sending end")
					var newmsg = '<div class="direct-chat-msg clearfix right mb-30">' +
    	                  				'<div class="direct-chat-text">'+
    	                  				'<p>' + d.msg + '</p>'+
    	                  				'<p class="direct-chat-timestamp"><time datetime="'+ d.year+'">'+ d.hourMin +'</time></p>'+
    	                  				'</div></div>';
					$("#direct-chat2").append(newmsg); 						
				}else{
					console.log("receving end")
					var newmsg ='<div class="direct-chat-msg clearfix left">'+    	            	  
 						' <div class="direct-chat-text" style="margin-left:0px;">' +
 						'<p>' + d.msg + '</p>' +
 						'<p class="direct-chat-timestamp"><time datetime="'+  d.year  +'">'+ d.hourMin+'</time></p>' +
 						'</div></div>';    	            	  					    	            	  
            	 $("#direct-chat2").append(newmsg);					
				}
				
			}else{
             console.warn("unknown type!")
             console.log(d.type)
             ok = d.type
          }
       }
    }
}











