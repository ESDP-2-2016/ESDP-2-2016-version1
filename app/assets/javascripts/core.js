$(document).ready(function () {
    $('.phone').inputmask('0999999999');

    $('#show-hide-aids-form').click(function(){
        $('#aids-form').slideToggle();
    });

    $('.post-item-pseudolink').click(function(){
        $(this).next('.post-item-content').slideToggle();
    });


    $('.show_aids').click(function(e){
        e.preventDefault();
        var post_aids_num = $(this).parent('.post-aids-num');
        $(post_aids_num).next('.post-aids-list').slideToggle();

        if($(this).children('span').hasClass('glyphicon-chevron-down')){
            $(this).children('span').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
        }else{
            $(this).children('span').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
        }
    });


    $('.link-scroll').click(function(e){
      e.preventDefault();
      var id_block = $(this).attr('href');
      var top = $(id_block).offset().top;
        var top = $(id_block).offset().top - 70;
      $('body').animate({scrollTop: top}, 1500);
    });

    var all_org = $("#organization-list").html();

    function renderOneOrg(org){
        var htmlOrg = '<div><h4><a href="/organizations/show/'+ org.slug +'">'+ org.name+'</a></h4>' +
            '<ul>' +
            '<li>'+ org.location +'</li>' +
            '<li>'+ org.address +'</li>' +
            '<li>'+ org.phone +'</li>' +
            '</ul></div>';
        return htmlOrg;
    }

    function renderListOrg(arrayOrg, id){
        for (var i = 0; i < arrayOrg.length; i++) {
            var oneOrg = renderOneOrg(arrayOrg[i]);
            $(id).append(oneOrg);
        }
    }

    function clearContent(id){
        $(id).html(' ');
    }

    function filter_organizations(organization_category_id) {
        $.ajax({
            type: "GET",
            url:  "/organizations/filter_organizations/"+organization_category_id,
            dataType: "json",
            success: function(data) {
                clearContent("#organization-list");
                renderListOrg(data.organizations,"#organization-list");
            }
        });
    }

    $("#filter_org").change(function(e){
        if(e.currentTarget.selectedIndex != 0) {
            filter_organizations(e.currentTarget.selectedIndex);
        }else{
            $("#organization-list").html(all_org);
        }
    });

});