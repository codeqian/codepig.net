$(document).ready(function(){
	$("#logoImgBig").fadeIn();
	$("#mainMenu").fadeIn();
	$("#content").fadeIn();
	var currentPage=0;
	// var animPage=null;

	$("#flashBtn").click(function(){changePage(1)});
	$("#androidBtn").click(function(){changePage(2)});
	$("#paintingBtn").click(function(){changePage(3)});
	$("#aboutBtn").click(function(){changePage(4)});

	$("#page1").hide();
	$("#page2").hide();
	$("#page3").hide();
	$("#page4").hide();

	//test

	function changePage(index){
		if(currentPage==0){
			$("#page0").addClass("moveoutclass");
			$("#page0").addEventListener("webkitAnimationEnd", function() {      alert("end");  });
			$("#logoImgBig").slideUp();
			$("#logoImgSmall").slideDown();
		}else{
			switch(currentPage){
				case 1:
				$("#flashBtn").removeClass("mainMenuBtnchoiced");
				$("#page1").removeClass("moveinclass");
				$("#page1").addClass("moveoutclass");
				var animPage=$("#page1");
				animPage.addEventListener("webkitAnimationEnd", animationListener);
				break;
				case 2:
				$("#androidBtn").removeClass("mainMenuBtnchoiced");
				$("#page2").removeClass("moveinclass");
				$("#page2").addClass("moveoutclass");
				break;
				case 3:
				$("#paintingBtn").removeClass("mainMenuBtnchoiced");
				$("#page3").removeClass("moveinclass");
				$("#page3").addClass("moveoutclass");
				break;
				case 4:
				$("#aboutBtn").removeClass("mainMenuBtnchoiced");
				$("#page4").removeClass("moveinclass");
				$("#page4").addClass("moveoutclass");
				break;
			}
		}
		switch(index){
			case 1:
			$("#flashBtn").addClass("mainMenuBtnchoiced");
			$("#page1").show();
			$("#page1").addClass("moveinclass");
			break;
			case 2:
			$("#androidBtn").addClass("mainMenuBtnchoiced");
			$("#page2").show();
			$("#page2").addClass("moveinclass");
			break;
			case 3:
			$("#paintingBtn").addClass("mainMenuBtnchoiced");
			$("#page3").show();
			$("#page3").addClass("moveinclass");
			break;
			case 4:
			$("#aboutBtn").addClass("mainMenuBtnchoiced");
			$("#page4").show();
			$("#page4").addClass("moveinclass");
			break;
		}
		currentPage=index;
	}

	function animationListener(){
		alert("end");
	    $("#page0").removeClass("moveoutclass");
	    $("#page0").hide();
	}
});