// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require autocomplete-rails

var fees;
var selectedIndex = 0;
var overrideRow1 = 0;
var overrideRow2 = 0;

$(document).ready(function() {
	$('#membership_fee_receipts').numeric();
	$('#membership_fee_creditcard').numeric();
	$('#membership_fee_refunds').numeric();
	$('#membership_fee_tax').numeric();

	$('#membership_fee_receipts').keyup(function(e){
			processFees();
	});
	$('#membership_fee_creditcard').keyup(function(e){
			processFees();
	});
	$('#membership_fee_refunds').keyup(function(e){
			processFees();
	});
	$('#membership_fee_tax').keyup(function(e){
			processFees();
	});
	$('#override-link').click(function(e) {
		$('#override-link').hide();
		$('#membership-fee').hide();
		$('#membership_fee_fee').show();
		$('#membership_fee_fee').val($("#membership-fee").text());
		
		return false;
	})

	$('#membership_fee_fee').keyup(function(e){
		processOverride();
	});
	
	$.ajax({
	    type: "GET",
	    url: "/fees",    
	    dataType: "json",
	    success: function(data){
			fees=data;
	    }
	  });
});

function processFees() {
	var fee = 0;
	receipts = parseInt($('#membership_fee_receipts').val());
	card = ($('#membership_fee_creditcard').val()) == "" ? 0 : parseInt($('#membership_fee_creditcard').val())
	refund = ($('#membership_fee_refunds').val()) == "" ? 0 : parseInt($('#membership_fee_refunds').val())
	tax = ($('#membership_fee_tax').val()) == "" ? 0 : parseInt($('#membership_fee_tax').val())

	aReceipts = (receipts-card-refund-tax);
	$('#adjusted-receipts').text(aReceipts.toFixed(2));
	for( var i=0; i<fees.length; i++ ){
		if (aReceipts >= fees[i].from && aReceipts < fees[i].to) {
			$("#membership-fee").text(fees[i].fee);	
			$('#membership_fee_fee').val(fees[i].fee);		
			$("#fee-row-" + selectedIndex).removeClass("rowOn");
			selectedIndex = i+1;
			$("#fee-row-" + selectedIndex).addClass("rowOn");
			break;
		}
	}
}

function processOverride() {
	overrideValue = $('#membership_fee_fee').val();
	console.log(overrideValue);
	if(overrideValue == 0) {
		$("#fee-row-" + selectedIndex).removeClass("rowOn");
		$("#fee-row-" + overrideRow1).removeClass("rowOn");
		$("#fee-row-" + overrideRow2).removeClass("rowOn");		
		selectedIndex = 0;
		overrideRow1 = 0;
		overrideRow2 = 0;
		return;
	}
	for( var i=0; i<fees.length; i++ ){
		console.log(i);
		if (i < fees.length-1) {
			console.log("from fees: "+fees[i].fee + " to " + fees[i+1].fee)
			if (overrideValue == parseInt(fees[i].fee)) {
				$("#membership-fee").text(fees[i].fee);			
				$("#fee-row-" + selectedIndex).removeClass("rowOn");
				$("#fee-row-" + overrideRow1).removeClass("rowOn");
				$("#fee-row-" + overrideRow2).removeClass("rowOn");
				selectedIndex = i+1;
				overrideRow1 = i+1;
				overrideRow2 = i+1;
				$("#fee-row-" + overrideRow1 ).addClass("rowOn");
				break;			
			}
			else if (overrideValue > parseInt(fees[i].fee) && overrideValue < parseInt(fees[i+1].fee)) {
				$("#membership-fee").text(fees[i].fee);			
				$("#fee-row-" + selectedIndex).removeClass("rowOn");
				$("#fee-row-" + overrideRow1).removeClass("rowOn");
				$("#fee-row-" + overrideRow2).removeClass("rowOn");
				selectedIndex = i+1;
				overrideRow1 = i+1;
				overrideRow2 = i+2;
			
				console.log("VAL: " + overrideValue);
				$("#fee-row-" + overrideRow1 ).addClass("rowOn");
				$("#fee-row-" + overrideRow2 ).addClass("rowOn");
				break;
			}
		}
		else {
			console.log("last one");
			$("#fee-row-" + selectedIndex).removeClass("rowOn");
			$("#fee-row-" + overrideRow1).removeClass("rowOn");
			$("#fee-row-" + overrideRow2).removeClass("rowOn");		
			selectedIndex = 0;
			overrideRow1 = fees.length;
			overrideRow2 = 0;
			$("#fee-row-" + overrideRow1 ).addClass("rowOn");
			return;
		}
	}
}

$(document).ready(function() {
	$('#clinic-link').click(function(e) {
	})
	
	$('#date-link').click(function(e) {
	})
	
});

function doClinicReport() {
	console.log("here");
	clinicId = $('#membership_fee_clinic_id').find(":selected").val();
	if (clinicId > 0) {	
		window.location = "/reports/show?mode=clinic&clinic="+clinicId;
	} else {
		alert("Make sure you select a clinic.")
	}
	
}

function doDateReport() {
		console.log("here2");
		month = $('#month_id').find(":selected").val();
		year = $('#year_id').find(":selected").val();
		window.location = "/reports/show?mode=date&month="+month+"&year="+year	
}