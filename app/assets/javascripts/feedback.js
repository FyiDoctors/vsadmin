(function($) {

    $.feedback = function(element, options) {
		$(function() {
			jQuery.support.placeholder = false;
			test = document.createElement('input');
			if('placeholder' in test) jQuery.support.placeholder = true;
		});
		
        var defaults = {
            foo: 'bar',
            onFoo: function() {}
        }

        var plugin = this;

        plugin.settings = {}

        var $element = $(element),
             element = element;

        plugin.init = function() {
            plugin.settings = $.extend({}, defaults, options);

			$("<style type='text/css'> \
			.reason-box { \
				position: relative; \
				cursor: pointer; \
				margin-right: 5px; \
			}\
			</style>").appendTo("head");

				
			plugin.overlay = $("<div />", {
				"id" : "feedback-overlay",
				"css" : {
					position: "absolute",
					width : "100%",
					height: "100%",
					top: "0px",
					left: "0px",
					opacity: ".5",
					display: "none",
					backgroundColor: "#000"
				}
			})
			var formHeight = "380px";
			if(!$.support.placeholder) {
				formHeight = "430px";
			}

			plugin.formBox = $("<div />", {
				"id" : "feedback-form",
				"css" : {
					position: "absolute",
					display: "none",
					left:"0",
					right:"0",
					top: "0",
					bottom: "0",
					marginLeft: "auto",
					marginRight: "auto",
					marginBottom: "auto",
					marginTop: "auto",
					width: "400px",
					height: formHeight,
					backgroundColor: "#FFF",
					borderRadius: "5px"
				}
			})
			
			$("<div />", {
				"id" : "feedback-title",
				"css" : {
					paddingLeft: "10px",
					paddingRight: "10px",
					paddingTop: "20px",
					paddingBottom: "10px",
					fontSize: "22px",
					fontWeight: "300"
				}
			}).text("Feedback").appendTo(plugin.formBox);

			$("<div />", {
				"id" : "feedback-instruct",
				"css" : {
					padding: "10px",
					fontSize: "12px"
				}
			}).text("Please tell us what you think. Any feedback is greatly appreciated.").appendTo(plugin.formBox);

			plugin.reasons = $("<div />", {
				"id" : "reason-block",
				"css" : {
					padding: "10px"
				}
			}).appendTo(plugin.formBox);

			plugin.question = $("<div />", {
				"id" : "question-item",
				"class" : "reason-box",
			}).click(function() {
				highlightButton($(this), "QUESTION");
			}).text("Question").appendTo(plugin.reasons);

			plugin.idea = $("<div />", {
				"id" : "idea-item",
				"class" : "reason-box",
			}).click(function() {
				highlightButton($(this), "IDEA");
			}).text("Idea").appendTo(plugin.reasons);
			
			plugin.problem = $("<div />", {
				"id" : "prob-item",
				"class" : "reason-box",
			}).click(function() {
				highlightButton($(this), "PROBLEM");
			}).text("Problem").appendTo(plugin.reasons);
						
			plugin.praise = $("<div />", {
				"id" : "praise-item",
				"class" : "reason-box",
			}).click(function() {
				highlightButton($(this), "PRAISE");
			}).text("Praise").appendTo(plugin.reasons);
										
			if(!$.support.placeholder) {
				$("<p/>", {
					id : "feedback-label",
					css: {
						paddingLeft: "10px"
					}
				}).text("Your Feedback").appendTo(plugin.formBox);
			}
	
			plugin.feedbackText = $("<textarea/>", {
				id : "feedback-text",
				rows : "4",
				placeholder: "Your feedback",
				"css" : {
					margin: "10px",
					width: "380px"
				}
			}).appendTo(plugin.formBox);

			if(!$.support.placeholder) {
				$("<p/>", {
					id : "email-label",
					css: {
						paddingLeft: "10px"
					}
				}).text("Email Address").appendTo(plugin.formBox);
			}
			
			plugin.email = $("<input/>", {
				id : "feedback-email",
				type : "text",
				placeholder: "Your email address",
				"css" : {
					margin: "10px",
					width: "380px"
				}
			}).appendTo(plugin.formBox);

			plugin.feedbackFooter = $("<div />" , {
				id : "feedback-footer",
				css : {
					borderTop: "1px solid #ECECEC",
					textAlign: "right",
					paddingRight: "10px",
					paddingTop: "20px"
				}
			}).appendTo(plugin.formBox);
			
			$("<input/>", {
				id : "feedback-ok",
				type : "button",
				value : "Submit",
				class : "confirm btn btn-primary",
				"css" : {
					marginRight: "10px"
				}
			}).click(function(){
				if(isValidEmailAddress(plugin.email.val())) {
					
					feedback = {feedback: {content: plugin.feedbackText.val(), feedback_type: plugin.feedbackType, email: plugin.email.val()}};

					$.ajax({
					        type: "POST",
					        url: "/feedbacks",
					        data: JSON.stringify(feedback),
					        contentType: "application/json; charset=utf-8",
					        dataType: "json",
					        success: function(data){
								plugin.overlay.hide();
								plugin.formBox.hide();
							},
					        failure: function(errMsg) {
								// TODO - ERROR HANDLE
					        }
					});
					plugin.feedbackText.val("");
					plugin.email.val("");
					highlightButton(plugin.question, "QUESTION");
					plugin.email.css("background-color", "#FFF");
					
				}
				else {
					plugin.email.css("background-color", "#f38484");
				}
			}).appendTo(plugin.feedbackFooter);

			$("<input/>", {
				id : "feedback-cancel",
				type : "button",
				value : "Cancel",
				class : "confirm btn btn-default",
				"css" : {
				}
			}).click(function() {
				plugin.overlay.hide();
				plugin.formBox.hide();
			}).appendTo(plugin.feedbackFooter);
			
			$("<div />", {
				id : "browser-version",
				css : {
					fontSize: "9px",
					lineHeight: "10px",
					paddingTop: "3px"
				}
			}).text(navigator.appName + " : " + navigator.appVersion).appendTo(plugin.feedbackFooter);
			
			plugin.feedbackTab = $("<div />", {
				"id" : "feedback-link"
			}).click(function() {
				plugin.showOverlay();
			}).appendTo(document.body).text("Feedback")

        	plugin.overlay.appendTo(document.body);
			plugin.formBox.appendTo(document.body);

			formatTypeButton(plugin.question, "fa fa-question-circle");
			formatTypeButton(plugin.idea, "fa fa-lightbulb-o");
			formatTypeButton(plugin.problem, "fa fa-exclamation-triangle");
			formatTypeButton(plugin.praise, "fa fa-heart");
			highlightButton(plugin.question, "QUESTION");
        }

        plugin.showOverlay = function() {
        	plugin.overlay.show();
			plugin.formBox.show();
			//plugin.formBox.fadeIn(400);
		}

        var formatTypeButton = function(item, icon) {
			item.css("width", "90px");
			item.css("text-align", "right");
			item.css("padding", "5px");
			item.css("display", "inline-block");
			item.css("border-radius", "5px");			

			$("<div />", {
				class: icon,
				css: {
					position: "absolute",
					left: "0px",
					color: "#000",
					width: "20px",
					height: "20px",
					fontSize: "20px",
					paddingLeft: "5px"
				}
			}).appendTo(item);

        }

        var highlightButton = function(item, type) {
			if (plugin.selected != null) 
				plugin.selected.css("background-color", "#FFF");
			item.css("background-color", "#ABABAB");
			plugin.selected  = item
			plugin.feedbackType = type;
        }

		var isValidEmailAddress = function(emailAddress) {
		    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
		    return pattern.test(emailAddress);
		};


        plugin.init();

    }

    $.fn.feedback = function(options) {

        return this.each(function() {
            if (undefined == $(this).data('feedback')) {
                var plugin = new $.feedback(this, options);
                $(this).data('feedback', plugin);
            }
        });

    }

})(jQuery);