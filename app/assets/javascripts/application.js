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
//= require bootstrap.min
//= require turbolinks
//= require_tree .
//= require autocomplete-rails

var override=false;
var fees_1;
var fees_2;
var fees;
var taxes;
var taxRate;
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
	if(!override) {
		var fee = 0;
		var aReceipts = 0;

		receipts = parseFloat($('#membership_fee_receipts').val());
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
	
		card = ($('#membership_fee_creditcard').val()) == "" ? 0 : parseFloat($('#membership_fee_creditcard').val())
		refund = ($('#membership_fee_refunds').val()) == "" ? 0 : parseFloat($('#membership_fee_refunds').val())
		tax = ($('#membership_fee_tax').val()) == "" ? 0 : parseFloat($('#membership_fee_tax').val())
	
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
				$("#fee").text(parseFloat(fees[i].fee).toFixed(2));
				taxAdd = fees[i].fee*(taxRate/100)
				//taxAdd = ($('#membership_fee_taxadd').val()) == "" ? 0 : parseFloat($('#membership_fee_taxadd').val())
				fee = parseFloat(fees[i].fee)+(taxAdd);
				$("#membership-fee").text(fee.toFixed(2));	
				$('#membership_fee_fee').val(fee);		
				$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).removeClass("rowOn");
				selectedIndex = i;
				$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).addClass("rowOn");
				$("#taxes").text(taxAdd.toFixed(2));
				$('#membership_fee_taxadd').val(taxAdd.toFixed(2));
		
				return;
			}
		}

		// revenue is above last fee slot. Pick max
		$("#fee").text(parseFloat(fees[fees.length-1].fee).toFixed(2));
		taxAdd = fees[fees.length-1].fee*(taxRate/100)
		fee = parseFloat(fees[fees.length-1].fee)+taxAdd;
		$("#membership-fee").text(fee.toFixed(2));	
		$('#membership_fee_fee').val(fee);		
		$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).removeClass("rowOn");
		selectedIndex = fees.length-1;
		$("#fee-row-" + fees[selectedIndex].model_id + "-" + fees[selectedIndex].id).addClass("rowOn");
		$("#ptaxes").text(taxAdd.toFixed(2));
		$('#membership_fee_taxadd').val(taxAdd.toFixed(2));
						
		return;
	}
	else {
		var aReceipts = 0;

		receipts = parseFloat($('#membership_fee_receipts').val());
		receipts = isNaN(receipts) ? 0 : receipts;	
		
		card = ($('#membership_fee_creditcard').val()) == "" ? 0 : parseFloat($('#membership_fee_creditcard').val())
		refund = ($('#membership_fee_refunds').val()) == "" ? 0 : parseFloat($('#membership_fee_refunds').val())
		tax = ($('#membership_fee_tax').val()) == "" ? 0 : parseFloat($('#membership_fee_tax').val())
	
		aReceipts = (receipts-card-refund-tax);
		if( isNaN(aReceipts) ) {
			$('#adjusted-receipts').text("0.00")
			aReceipts = 0;
		}
		else {
			$('#adjusted-receipts').text(aReceipts.toFixed(2));		
		}
	 	
	}
}

function processOverride() {
	var overrideValue = $('#fee-override').val();
	var taxAdd = overrideValue*(taxRate/100);
	$("#taxes").text(taxAdd.toFixed(2));
	$("#membership_fee_taxadd").val(taxAdd.toFixed(2));
	var fee = parseFloat(overrideValue)+parseFloat(taxAdd);
	$("#membership-fee").text(fee.toFixed(2));	
	$('#membership_fee_fee').val(fee);		
	
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
	$("#date-link").attr("href", "/reports/show?mode=month&month="+month+"&year="+year);
	$("#submit-link").attr("href", "/reports/show?mode=submit&month="+month+"&year="+year);
}

function doDateReport() {
		window.location = "/reports/show?mode=month&month="+month+"&year="+year	
}

function getTaxRecord(province) {
	for( var i=0; i<taxes.length; i++ ){
		if (province == taxes[i].province) {
			taxRate = parseInt(taxes[i].rate);
			$("#tax-name").text(taxes[i].province + " Provincial Tax (" + taxes[i].rate + "% " + taxes[i].name + ")")
		}
		
	}
	
}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    return pattern.test(emailAddress);
};

