/**
 * 
 */
sidebarToggle = 1
$("#sidebar-toggle").click(function(){
	if(sidebarToggle == 1){
		$(".light-logo").hide()		
		sidebarToggle = 2
	}else if(sidebarToggle == 2){
		$(".light-logo").show()
		sidebarToggle = 1
	}
})