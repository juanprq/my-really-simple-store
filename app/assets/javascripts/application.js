// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require metisMenu/dist/metisMenu
//= require startbootstrap-sb-admin-2/dist/js/sb-admin-2
//= require bootstrap-sweetalert/lib/sweet-alert
//= require_tree .
(function($, swal){
  $(document).ready(function(){
    $('a.inactivate').click(function(event) {
      event.preventDefault();
      var link = $(this);
      var href = link.attr('href');
      var message = link.data('message');

      // swal dialog to confirm the delete
      swal({
        title: '¿Se encuentra seguro?',
        text: message,
        type: 'warning',
        showCancelButton: true,
        confirmButtonClass: 'btn-danger',
        confirmButtonText: '!Inactivar registro!',
        cancelButtonText: 'Cancelar',
        closeOnConfirm: false
      },
      function(){
        // confirm callback
        var method = 'delete',
          csrfToken = $('meta[name=csrf-token]').attr('content'),
          csrfParam = $('meta[name=csrf-param]').attr('content'),
          form = $('<form method="post" action="' + href + '"></form>'),
          metadataInput = '<input name="_method" value="' + method + '" type="hidden" />';

        if (csrfParam !== undefined && csrfToken !== undefined) {
          metadataInput += '<input name="' + csrfParam + '" value="' + csrfToken + '" type="hidden" />';
        }

        form.hide().append(metadataInput).appendTo('body');
        form.submit();
      });
    });
  });
})($, swal);