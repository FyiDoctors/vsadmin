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
//= require jquery.ui.all
//= require turbolinks
//= require_tree .
//= require autocomplete-rails

var fees_1;
var fees_2;
var fees;
var selectedIndex = 0;
var overrideRow1 = 0;
var overrideRow2 = 0;

history.navigationMode = 'compatible';

$(document).ready(function() {

});

function validateFrom() {
	return false;
}

function processFees() {
	var fee = 0;
	var aReceipts = 0;

	receipts = parseInt($('#membership_fee_receipts').val());
	receipts = isNaN(receipts) ? 0 : receipts;	
	
	if(receipts == 0) {
		$('#membership_fee_creditcard').prop("disabled", true);
		$('#membership_fee_refunds').prop("disabled", true);
		$('#membership_fee_tax').prop("disabled", true);
		$('#membership_fee_creditcard').val("0");
		$('#membership_fee_refunds').val("0");
		$('#membership_fee_tax').val("0");
		$('#cc-lbl').css('opacity', '.5');
		$('#ref-lbl').css('opacity', '.5');
		$('#tax-lbl').css('opacity', '.5');
	}
	else {
		$('#membership_fee_creditcard').prop("disabled", false);
		$('#membership_fee_refunds').prop("disabled", false);
		$('#membership_fee_tax').prop("disabled", false);
		$('#cc-lbl').css('opacity', '1');
		$('#ref-lbl').css('opacity', '1');
		$('#tax-lbl').css('opacity', '1');
	}

	card = ($('#membership_fee_creditcard').val()) == "" ? 0 : parseInt($('#membership_fee_creditcard').val())
	refund = ($('#membership_fee_refunds').val()) == "" ? 0 : parseInt($('#membership_fee_refunds').val())
	tax = ($('#membership_fee_tax').val()) == "" ? 0 : parseInt($('#membership_fee_tax').val())
	
	aReceipts = (receipts-card-refund-tax);
 	if( isNaN(aReceipts) ) {
		$('#adjusted-receipts').text("0.00")
		aReceipts = 0;
	}
	else {
		$('#adjusted-receipts').text(aReceipts.toFixed(2));		
	}

	
	for( var i=0; i<fees.length; i++ ){
		if (aReceipts >= fees[i].from && aReceipts < fees[i].to) {
			fee = parseInt(fees[i].fee);
			$("#membership-fee").text(fee.toFixed(2));	
			$('#membership_fee_fee').val(fee.fee);		
			$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).removeClass("rowOn");
			selectedIndex = i;
			$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).addClass("rowOn");
						
			return;
		}
	}

	// revenue is above last fee slot. Pick max
	fee = parseInt(fees[fees.length-1].fee);
	$("#membership-fee").text(fee.toFixed(2));	
	$('#membership_fee_fee').val(fee.fee);		
	$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).removeClass("rowOn");
	selectedIndex = fees.length-1;
	$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).addClass("rowOn");
				
	return;

}

function processOverride() {
	overrideValue = $('#membership_fee_fee').val();
	console.log(overrideValue);
	if(overrideValue == 0) {
		$("#fee-row-" + fees[selectedIndex].model_id + "_" + selectedIndex).removeClass("rowOn");
		$("#fee-row-" + fees[selectedIndex].model_id + "_" + overrideRow1).removeClass("rowOn");
		$("#fee-row-" + fees[selectedIndex].model_id + "_" + overrideRow2).removeClass("rowOn");		
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
				console.debug("HERE" + overrideRow1)	
				$("#fee-row-" + fees[selectedIndex].id).removeClass("rowOn");
				$("#fee-row-" + fees[overrideRow1].id).removeClass("rowOn");
				$("#fee-row-" + fees[overrideRow2].id).removeClass("rowOn");
				selectedIndex = i;
				overrideRow1 = i;
				overrideRow2 = i;
				$("#fee-row-" + fees[overrideRow1].id ).addClass("rowOn");
				break;			
			}
			else if (overrideValue > parseInt(fees[i].fee) && overrideValue < parseInt(fees[i+1].fee)) {
				$("#membership-fee").text(fees[i].fee);			
				$("#fee-row-" + fees[selectedIndex].id).removeClass("rowOn");
				$("#fee-row-" + fees[overrideRow1].id).removeClass("rowOn");
				$("#fee-row-" + fees[overrideRow2].id).removeClass("rowOn");
				selectedIndex = i;
				overrideRow1 = i;
				overrideRow2 = i+1;
			
				console.log("VAL: " + overrideValue);
				$("#fee-row-" + fees[overrideRow1].id ).addClass("rowOn");
				$("#fee-row-" + fees[overrideRow2].id ).addClass("rowOn");
				break;
			}
		}
		else {
			console.log("last one");
			$("#fee-row-" + fees[selectedIndex].id).removeClass("rowOn");
			$("#fee-row-" + fees[overrideRow1].id).removeClass("rowOn");
			$("#fee-row-" + fees[overrideRow2].id).removeClass("rowOn");		
			selectedIndex = 0;
			overrideRow1 = fees.length;
			overrideRow2 = 0;
			$("#fee-row-" + fees[overrideRow1].id ).addClass("rowOn");
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
	clinicId = $('#membership_fee_clinic_id').val();
	if (clinicId > 0) {	
		window.location = "/reports/show?mode=clinic&clinic="+clinicId;
	} else {
		alert("Make sure you select a clinic.")
	}
	
}
function updateMonthLink() {
	month = $('#month_id').find(":selected").val();
	year = $('#year_id').find(":selected").val();
	$("#date-link").attr("href", "/reports/show?mode=date&month="+month+"&year="+year);
}

function doDateReport() {
		window.location = "/reports/show?mode=date&month="+month+"&year="+year	
}

