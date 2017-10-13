var user_id = $('#user_id').val();
var identifier = $('#identifier').val();
var site_path = $('#site_path').val();
   	
$('.nav-list li.active').removeClass('active');

var menuItem =  $('#menu-item').val();
$('#'+menuItem).addClass('active');

$.fn.scrollView = function () {
    return this.each(function () {
        $('html, body').animate({
            scrollTop: $(this).offset().top
        }, 500);
    });
} 

$(document).ready(function () {
    
	getMenuStats();
	
    $('.nav-list').on('click', 'li', function() {
        $('.nav-list li.active').removeClass('active');
        $(this).addClass('active');
    });
    
   	toastr.options = {
   	   		"debug": false,
   	   		"positionClass": "toast-top-full-width",
   	   		"onclick": null,
   	   		"fadeIn": 300,
   	   		"fadeOut": 300,
   	   		"timeOut": 3000
   	}
   
})


   	function displaySuccess(msg) {
   	  		toastr.success(msg);
   	}
   		
   	function displayError(msg) {
   		toastr.error(msg);
   	}
   	
   	
	function getMenuStats() {
		
    	$.getJSON("functions/profile_functions.php", { f: 'getmystats', user_id: user_id, identifier: identifier }, function(data) {
    		
        	$('.profile_views').html(data.profile_views_total);
        	$('.profile_winks').html(data.profile_winks_total);
        	$('.profile_meet_me').html(data.profile_meet_me_total);
        	$('.profile_favorites_me').html(data.profile_favorites_me_total);
        	$('.profile_my_favorites').html(data.profile_my_favorites);
        	$('.profile_my_connections').html(data.profile_connections);
        	
        	if (data.profile_new_messages > 0) {
        		$('.profile_inbox').html(data.profile_new_messages);
    		}
        	
		});
	}	
	
	function getFeaturedLocalMembers() {
	        
	   	$.getJSON("functions/profile_functions.php", { f: 'getfeaturedlocalmembers', user_id: user_id }, function(data) {

	   		if(data) {
	    			
	   			$.each(data.featured_users, function(i, info) {
	   				$("#featured-users").append('<a href="profile_id.php?id='+info.user_id+'"><img width="72" height="72" class="rsTmb" id="'+info.user_id+'" src="'+info.thumb_url+'" /></a>');
	   			});
		    		
	   		 	$('#featured-users').royalSlider({
	       		    fullscreen: {
	    		      enabled: false,
	       		      nativeFS: false
	       		    },
	       		    controlNavigation: 'thumbnails',
	       		    autoScaleSlider: false, 
	       		    loop: false,
	       		    imageScaleMode: 'fit-if-smaller',
	       		    navigateByClick: true,
	       		    numImagesToPreload:0,
	       		    arrowsNav:true,
	       		    arrowsNavAutoHide: true,
	       		    arrowsNavHideOnTouch: true,
	       		    keyboardNavEnabled: true,
	       		    fadeinLoadedSlide: false,
	       		    globalCaption: false,
	       		    globalCaptionInside: false,
	       		    thumbs: {
	       		      appendSpan: true,
	       		      firstMargin: true,
	       		      paddingBottom: 0
	       		    }
	       		});

	   		 	$('#featured-users').on('click', '.rsTmb', function() {
	   		 		if(!$('.royalSlider').data('royalSlider').dragSuccess) {
	    			 		
	   			 		var user_id = $(this).attr('id');
	   			 		window.location.href = 'profile_id.php?id=' + user_id;
	   		 	  	}
	   		 	});
	   		}   
		});
	}
	
	//Function called to check input fields and register user
	function login() {
		
		$('.required').focus(function() {
			$(this).closest('.form-group').removeClass("has-error");
		});
				
		var formValid = true;
		
		var email = $('#email').val().trim();
		if(email.length == 0) {
			formValid = false;
			$('#email-field').addClass('has-error');
		}
		
		var password = $('#password').val().trim();
		if(password.length == 0) {
			formValid = false;
			$('#password-field').addClass('has-error');
		}
		
		if (!formValid) {
			return false;
		}  
		
		$('#login-btn').button('loading');
				
		var params = $("#login-form" ).serialize();
		
		$.post("functions/login_functions.php", {f: 'wlogin', params: params}, function(data) {
			
			if (data.success) {
				
				var page = "home.php";
				if (data.referer) {
					page = data.referer;
				}
				
				window.location.href = page;
			}
			else {
				
				displayError(data.error);
				
				if (data.code) {
					if (data.code == '100') {
						$('#username-field').addClass('has-error');
					}
					else if (data.code == '101') {
						$('#password-field').addClass('has-error');
					}
				}
	    	}
			
			$('#login-btn').button('reset');
	    	  	                
		}, "json");  
	}
	
	function forgot() {
			
		$('.required').focus(function() {
			$(this).closest('.form-group').removeClass("has-error");
		});
			
		var formValid = true;
			
		var password = $('#useremail').val().trim();
		if(password.length == 0) {
			formValid = false;
			$('#usermail-field').addClass('has-error');
		}
			
		if (!formValid) {
			return false;
		}  
			
		$('#forgot-btn').button('loading');
			
		var params = $("#forgot-form" ).serialize();
			
		$.post("functions/password_functions.php", {f: 'sendlink', params: params}, function(data) {
		
			if (data.success) {
				displaySuccess(data.msg);
			}
			else {
				displayError(data.error);
	    	}
				
			$('#forgot-btn').button('reset');
	    	  	                
		}, "json");
	}
	
	
	function resetpw() {
		
		$('.required').focus(function() {
			$(this).closest('.form-group').removeClass("has-error");
		});
			
		var formValid = true;
			
		var password1 = $('#password1').val().trim();
		if(password1.length == 0) {
			formValid = false;
			$('#password1-field').addClass('has-error');
		}
			
		var password2 = $('#password2').val().trim();
		if(password2.length == 0) {
			formValid = false;
			$('#password2-field').addClass('has-error');
		}
		
		if (!formValid) {
			return false;
		}  
			
		$('#reset-btn').button('loading');
			
		var params = $("#reset-form" ).serialize();
			
		$.post("functions/password_functions.php", {f: 'resetpassword', params: params}, function(data) {
		
			if (data.success) {
				displaySuccess(data.msg);
			}
			else {
				displayError(data.error);
	    	}
				
			$('#reset-btn').button('reset');
	    	  	                
		}, "json");
	
	}