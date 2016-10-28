$(document).ready(function () {
    // необходимые настройки карты
    var defaultCoordinate = [42.87, 74.60];
    var defaultCoordinateKyrgyzstan = [41.25, 74.60];
    var leafletURL = 'https://api.mapbox.com/styles/v1/tsvetkovamariia/cited6yv400an2hrzaezesxtn/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoidHN2ZXRrb3ZhbWFyaWlhIiwiYSI6ImNpdGU4dnhvMTAwY2EyeW1qM216aDN3aHgifQ.D-AjvTmNye975Riw4LfT2A';
    var defaultZoom = 13;
    var MAX_POST_TEASER_SIZE = 350;

    var userIcon = '/assets/map/icon-marker-user.svg';
    var organizationIcon = '/assets/map/icon-marker-ok.svg';
    var organizationAlertIcon = '/assets/map/icon-marker-alert.svg';


    function initializeMap(mapId, coordinate, zoom) {
        var mapZoom = zoom || defaultZoom;
        var mapCoordinate = coordinate || defaultCoordinate;
        var map = L.map(mapId).setView(mapCoordinate, mapZoom);
        L.tileLayer(leafletURL, {
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
            maxZoom: 18
        }).addTo(map);
        return map;
    }

    function moveMarker(options) {
        var e = options.event;
        options.marker.setLatLng(e.latlng);
        options.map.panTo(e.latlng);
    }

    function resetMarker(options) {
        var coordinate = options.coordinate || defaultCoordinate;
        options.marker.setLatLng(coordinate);
        options.map.panTo(coordinate);
    }

    function updateFields(options) {
        options.fieldLatitude.value = options.marker.getLatLng().lat;
        options.fieldLongitude.value = options.marker.getLatLng().lng;
    }
    function updateMarker(options) {
        var lt = parseFloat(options.fieldLatitude.value);
        var ln = parseFloat(options.fieldLongitude.value);
        var newCoordinate = new L.LatLng(lt, ln);
        options.marker.setLatLng(newCoordinate);
        options.map.panTo(newCoordinate);
    }

    function organizationHasPosts(id, posts) {
        var result = null;
        for (var i = 0; i < posts.length; ++i) {
            if (posts[i].organization_id == id) {
                return posts[i];
            }
        }
        return result;

    }

    function createIcon(imageUrl) {
        var newIcon = L.icon({
            iconUrl: imageUrl,
            iconSize: [38, 40],
            iconAnchor: [22, 42],
            popupAnchor: [-3, -45]
        });
        return newIcon;
    }

    function highLightCountryBorders(map, arrayOfCoordinates){
        var mapStyle = {
            color: "#6cce44",
            opacity: 1,
            weight: 3,
            fillOpacity: 0
        };
        L.geoJson(arrayOfCoordinates, {
            style: mapStyle
        }).addTo(map);
    }


    function populateMap(map, data) {
        var organizations = data.organizations;
        var posts = data.posts;
        for (var i = 0; i < organizations.length; ++i) {
            var org = organizations[i];
            if (org.latitude && org.longitude) {
                var iconUrl = "";
                var orgCoordinate = new L.latLng(parseFloat(org.latitude), parseFloat(org.longitude));
                var popupContent = "";
                var post = organizationHasPosts(org.id, posts);
                if (post) {
                    var postTeaser = post.body.substring(0, MAX_POST_TEASER_SIZE);
                    iconUrl = organizationAlertIcon;
                    popupContent = "<h5><a href='/posts/"+ post.id + "'>" +  post.title+ "</a></h5>" +
                        "<p class='marker-post'>"+ postTeaser +"</p>" +
                        "<p>Опубликовал <a href='organizations/show/"+ org.id +"'>" + org.name  + "</a></p>"  +
                        "<a href='/posts/" + post.id + "' class='btn btn-success'>Details</a>";
                } else {
                    iconUrl = organizationIcon;
                    var descriptionText = org.description||org.address;
                    popupContent = "<h5><a href='organizations/show/'"+org.id+"></a>" + org.name + "</h5>" +
                                    "<p>" + descriptionText + "</p>" +
                                    "<a href='/organizations/show/" + org.id + "'>Details</a>";
                }
                var marker = L.marker(orgCoordinate, {icon: createIcon(iconUrl)}).addTo(map);
                marker.bindPopup(popupContent);
            }
        }
    }

    function enableMoveMarkerToUserLocation(options) {
        options.userLocationButton.onclick = function(){
           options.map.locate({setView: true, maxZoom: 15});
        };
        options.map.on('locationfound', onLocationFound);
        function onLocationFound(e) {
            options.event = e;
            moveMarker(options);
            options.marker.bindPopup("Вы находитесь тут").openPopup();
            updateFields(options);
        }
    }

    function enableAddMarkerToUserLocation(options, zoom)
    {
        var mapZoom = zoom || defaultZoom;
        options.userLocationButton.onclick = function(){
          options.map.locate({setView: true, maxZoom: mapZoom});
        };

        options.map.on('locationfound', function(e) {
            var marker = L.marker(e.latlng, {icon: createIcon(userIcon)}).addTo(options.map);
            marker.bindPopup("Вы тут").openPopup();
        });
    }

    function enableMarkerMoves(options){
        options.map.on('click', function(e) {
            options.event = e;
            moveMarker(options);
            updateFields(options);
        });

        options.fieldLongitude.oninput = function() {updateMarker(options)};
        options.fieldLatitude.oninput = function() {updateMarker(options)};
    }



    function enableResetMap(options){
        options.resetMapButton.onclick = function() {
            resetMarker(options);
            updateFields(options);
        };
    }



    //////////////////////////////////////////////////////////////
    ///////  Настройки для каждой карты на страницах /////////////
    //////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////
    ///// Карта на странице формы регистрации(organizations/new, edit) ///
    //////////////////////////////////////////////////////////////////////

    if (document.getElementById("new-organization-map")!=null){
        var map = initializeMap("new-organization-map");
        var marker = L.marker(defaultCoordinate, {icon: createIcon(organizationIcon)}).addTo(map);

        var mapOptions = {
            map: map,
            marker: marker,
            fieldLatitude: document.getElementById('latitude'),
            fieldLongitude: document.getElementById('longitude'),
            resetMapButton: document.getElementById('map-reset'),
            userLocationButton: document.getElementById('btn-locate-user')
        };

        updateFields(mapOptions);
        enableMarkerMoves(mapOptions);
        enableResetMap(mapOptions);
        enableMoveMarkerToUserLocation(mapOptions);
    }

    ////////////////////////////////////////////////////////////////////
    /// Карта на странице просмотра организации (organizations/show) ///
    ////////////////////////////////////////////////////////////////////

    if (document.getElementById("organization-map")!=null){
        var orgLongitude = parseFloat(document.getElementById("org-longitude").innerHTML);
        var orgLatitude = parseFloat(document.getElementById("org-latitude").innerHTML);
        var coordinate = new L.latLng(orgLatitude, orgLongitude);
        // создать карту и маркер для организации
        var orgMap = initializeMap('organization-map', coordinate);
        var marker = L.marker(coordinate, {icon: createIcon(organizationIcon)}).addTo(orgMap);
        orgMap.panTo(coordinate);

        var orgMapOptions = {
            marker: marker,
            map: orgMap,
            userLocationButton: document.getElementById('btn-locate-user')
        };

        enableAddMarkerToUserLocation(orgMapOptions, 13);

    }


    ////////////////////////////////
    // Карта на главной странице ///
    ////////////////////////////////
    if (document.getElementById("main-map")!=null){
        var indexMap = initializeMap("main-map", defaultCoordinateKyrgyzstan , 7);

        var indexMapOptions = {
            map: indexMap,
            userLocationButton: document.getElementById('btn-locate-user')
        };

        enableAddMarkerToUserLocation(indexMapOptions, 14);
        highLightCountryBorders(indexMapOptions.map, placeData);

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
