// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function barCodeReader(){
	console.log("bind");

	$(".barcode").change(function(){
		var student = studentsHash[$(this).val()];
		if(student == undefined){
			alert("Estudiante NO encontrado");
			$("#agregar-estudiantes").modal('show');
			$("#guardar-estudiante").hide();		
		}
		else{
			$("#full_name_field").html(studentsHash[$(this).val()]["name"]);
			$("#guardar-estudiante").show();

		}

	})
}


function showName(){
		$("#students_names").html(studentsHash[1088302970]["name"]) 
}