$(document).ready(function () {
    // необходимые настройки карты
    g
    var defaultCoordinate = [42.87, 74.60];
    var leafletURL = 'https://api.mapbox.com/styles/v1/tsvetkovamariia/cited6yv400an2hrzaezesxtn/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoidHN2ZXRrb3ZhbWFyaWlhIiwiYSI6ImNpdGU4dnhvMTAwY2EyeW1qM216aDN3aHgifQ.D-AjvTmNye975Riw4LfT2A';

    // методы для взаимодействия с картой
    function moveMarker(e) {
        marker.setLatLng(e.latlng);
        mymap.panTo(e.latlng);
    }

    function resetMarker(){
        marker.setLatLng(defaultCoordinate);
        mymap.panTo(defaultCoordinate);
    }

    function updateFields() {
        fieldLatitude.value = marker.getLatLng().lat;
        fieldLongitude.value = marker.getLatLng().lng;
    }

    function updateMarker() {
        var lt = parseFloat(fieldLatitude.value);
        var ln = parseFloat(fieldLongitude.value);
        var newCoordinate = new L.LatLng(lt, ln);
        marker.setLatLng(newCoordinate);
        mymap.panTo(newCoordinate);
    }

    function organizationHasPosts(id, posts){
        var result = null;
        for(var i=0; i< posts.length; ++i)
        {
            if(posts[i].organization_id == id)
            {
                return posts[i];
            }
        }
        return result;

    }

    function createIcon(imageUrl){
        var newIcon = L.icon({
            iconUrl: imageUrl,
            iconSize: [38, 40],
            iconAnchor: [22, 42],
            popupAnchor: [-3, -45]
        });
        return newIcon;
    }

    function populateMap(map, data) {
        var organizations = data.organizations;
        var posts = data.posts;
        for (var i = 0; i < organizations.length; ++i)
        {
            var org = organizations[i];
            if(org.latitude && org.longitude)
            {
                var iconUrl = "";
                var orgCoordinate = new L.latLng(parseFloat(org.latitude), parseFloat(org.longitude));
                var popupContent = "";
                var post = organizationHasPosts(org.id, posts);
                if(post)
                {
                    iconUrl = '/assets/marker-important.svg';
                    popupContent = "<h5>" + org.name + "</h5><a href='/posts/"+ post.id +"'>"+ post.title +"</a>";
                } else
                {
                    iconUrl = '/assets/marker-default.svg';
                    popupContent = "<h5>" + org.name + "</h5><p>" + org.address + "</p>";
                }
                var marker = L.marker(orgCoordinate, {icon: createIcon(iconUrl)}).addTo(map);
                marker.bindPopup(popupContent);
            }
        }
    }

    // Карта на странице формы
    if (document.getElementById("map")!=null){
        var fieldLatitude  = document.getElementById('latitude');
        var fieldLongitude = document.getElementById('longitude');
        var btnReset = document.getElementById('map-reset');
        var mymap = L.map('map').setView(defaultCoordinate, 13);
        L.tileLayer(leafletURL, {
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18
            }).addTo(mymap);
        var marker = L.marker(defaultCoordinate).addTo(mymap);
        fieldLatitude.value = marker.getLatLng().lat;
        fieldLongitude.value = marker.getLatLng().lng;
        mymap.on('click', function(e) {
            moveMarker(e);
            updateFields();
        });

        fieldLongitude.onkeydown = function() {updateMarker()} ;
        fieldLatitude.onkeydown = function() {updateMarker()} ;

        btnReset.onclick = function() {
            resetMarker();
            updateFields();
        };
    }

    // Карта на главной странице
    if (document.getElementById("index-map")!=null){
        var indexMap = L.map('index-map').setView(defaultCoordinate, 10);
        L.tileLayer(leafletURL, {
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18
        }).addTo(indexMap);

        $.ajax({
            type: "GET",
            url:  "/organizations/list",
            dataType: "json",
            success: function(data) {
                populateMap(indexMap, data);
            }
        });
    }
});
