(function(){$(document).on("ready page:load turbolinks:load",function(){return $(document).on("focus","input.datepicker:not(.hasDatepicker)",function(){var t,e,n;if(e=$(this),"date"!==e[0].type)return t={dateFormat:"yy-mm-dd"},n=e.data("datepicker-options"),e.datepicker($.extend(t,n))})})}).call(this);