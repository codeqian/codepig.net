$(document).ready(function(){
	$("body").fadeIn();
	var currentPage=0;
	var pageI;

	$("#flashBtn").click(function(){myChangePage(1,false)});
	$("#androidBtn").click(function(){myChangePage(2,false)});
	$("#paintingBtn").click(function(){myChangePage(3,false)});
	$("#aboutBtn").click(function(){myChangePage(4,false)});

	$("#content").bind('swiperight', function() {
		if (currentPage == 0 || currentPage == 1) {
			pageI = 4;
		} else {
			pageI = currentPage - 1;
		}
		myChangePage(pageI);
	}).bind('swipeleft', function() {
		var pageI;
		if (currentPage == 4) {
			pageI = 1;
		} else {
			pageI = currentPage + 1;
		}
		myChangePage(pageI);
	});
	//test

	function myChangePage(index){
		switch(currentPage){
			case 1:
				$("#flashBtn").removeClass("mainMenuBtnchoiced");
				break;
			case 2:
				$("#androidBtn").removeClass("mainMenuBtnchoiced");
				break;
			case 3:
				$("#paintingBtn").removeClass("mainMenuBtnchoiced");
				break;
			case 4:
				$("#aboutBtn").removeClass("mainMenuBtnchoiced");
				break;
		}
		if(index<currentPage) {
			switch (index){
				case 1:
					$.mobile.changePage("#page1", {transition: "slide", reverse:true});
					break;
				case 2:
					$.mobile.changePage("#page2", {transition: "slide", reverse:true});
					break;
				case 3:
					$.mobile.changePage("#page3", {transition: "slide", reverse:true});
					break;
				case 4:
					$.mobile.changePage("#page4", {transition: "slide", reverse:true});
					break;
			}
		}else {
			switch (index){
				case 1:
					$.mobile.changePage("#page1", {transition: "slide"});
					break;
				case 2:
					$.mobile.changePage("#page2", {transition: "slide"});
					break;
				case 3:
					$.mobile.changePage("#page3", {transition: "slide"});
					break;
				case 4:
					$.mobile.changePage("#page4", {transition: "slide"});
					break;
			}
		}
		switch (index){
			case 1:
				$("#flashBtn").addClass("mainMenuBtnchoiced");
				break;
			case 2:
				$("#androidBtn").addClass("mainMenuBtnchoiced");
				break;
			case 3:
				$("#paintingBtn").addClass("mainMenuBtnchoiced");
				break;
			case 4:
				$("#aboutBtn").addClass("mainMenuBtnchoiced");
				break;
		}
		currentPage=index;
	}
});