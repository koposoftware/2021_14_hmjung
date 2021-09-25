/**
 * 
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


