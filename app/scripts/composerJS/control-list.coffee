#
# Created with HopStack.
# User: thinq4yourself
# Date: 2014-09-01
# Time: 08:10 AM
# To change this template use Tools | Templates.
#

'use strict';

angular.module('composerJS.control-list', [])

.controller('ControlListCtrl', [
    '$scope'
    ($scope) ->
        $scope.oneAtATime = true
        $scope.groups = [
            {
                title: "Content Area"
            }
            {
                title: "Widgets"
            }
            {
                title: "Search"
            }
            {
                title: "Service"
            }
            {
                title: "Security"
            }

        ]
        $scope.items = [
            "Item 1"
            "Item 2"
            "Item 3"
        ]

        $scope.status =
            isFirstOpen: true
            isFirstOpen1: true
            isFirstOpen2: true
            isFirstOpen3: true
            isFirstOpen4: true
            isFirstOpen5: true
            isFirstOpen6: true

        $scope.addItem = ->
            newItemNo = $scope.items.length + 1
            $scope.items.push "Item " + newItemNo
            return
        return
])

