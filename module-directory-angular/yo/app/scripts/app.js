'use strict';

angular.module('angularApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
]).controller('directoryCtrl', function($scope, $resource) {
    var DirectoriesResource = $resource('/lutangular/rest/directory.json', {});
    DirectoriesResource.query({}, function(directories) {
        $scope.directories = directories;
    });

    $scope.showRecords = function(directoryId) {
        var RecordResource = $resource('/lutangular/rest/directory/:directoryId/records.json');
        RecordResource.query({
            directoryId: directoryId
        }, function(records) {
            $scope.records = records;
        });
    };
});
