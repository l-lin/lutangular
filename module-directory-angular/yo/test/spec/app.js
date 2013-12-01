'use strict';

describe('Controller: directoryCtrl', function () {

//    load the controller's module
    beforeEach(module('angularApp'));

    var directoryCtrl,
        scope;

    // Initialize the controller and a mock scope
    beforeEach(inject(function ($controller, $rootScope) {
        scope = $rootScope.$new();
        directoryCtrl = $controller('directoryCtrl', {
            $scope: scope
        });
    }));

    it('should be defined', function () {
        expect(directoryCtrl).toBeDefined();
    });
});
