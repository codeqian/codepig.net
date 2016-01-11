$(document).ready(function(){
	$("#mainMenu").fadeIn();
	$("#content").fadeIn();
	var currentPage=0;

	function changePage(index){
		alert(currentPage);
		if(currentPage==0){
			$("#logoImgBig").slideUp();
			$("#logoImgSmall").slideDown();
		}
		alert("changeLogo");
		currentPage=index;
	}
});