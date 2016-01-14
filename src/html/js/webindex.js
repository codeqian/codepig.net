$(document).ready(function(){
	$("body").fadeIn();
	var currentPage=0;
	var animPage=null;
	var changeStop=true;

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
		if(changeStop){
			changeStop=false;
			if(currentPage==0){
				animPage=$("#page0");
				animPage.addClass("moveoutclass");
				animPage.on("animationend webkitAnimationEnd oAnimationEnd", animationListener);
				$("#logoImgBig").slideUp();
				$("#logoImgSmall").slideDown();
			}else{
				switch(currentPage){
					case 1:
						$("#flashBtn").removeClass("mainMenuBtnchoiced");
						$("#page1").removeClass("moveinclass");
						animPage=$("#page1");
						animPage.addClass("moveoutclass");
						animPage.on("animationend webkitAnimationEnd oAnimationEnd", animationListener);
						break;
					case 2:
						$("#androidBtn").removeClass("mainMenuBtnchoiced");
						$("#page2").removeClass("moveinclass");;
						animPage=$("#page2");
						animPage.addClass("moveoutclass");
						animPage.on("animationend webkitAnimationEnd oAnimationEnd", animationListener);
						break;
					case 3:
						$("#paintingBtn").removeClass("mainMenuBtnchoiced");
						$("#page3").removeClass("moveinclass");
						animPage=$("#page3");
						animPage.addClass("moveoutclass");
						animPage.on("animationend webkitAnimationEnd oAnimationEnd", animationListener);
						break;
					case 4:
						$("#aboutBtn").removeClass("mainMenuBtnchoiced");
						$("#page4").removeClass("moveinclass");;
						animPage=$("#page4");
						animPage.addClass("moveoutclass");
						animPage.on("animationend webkitAnimationEnd oAnimationEnd", animationListener);
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
	}

	function animationListener(){
		animPage.removeClass("moveoutclass");
		animPage.hide();
		changeStop=true;
	}
});