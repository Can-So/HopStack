'use strict'

angular.module('app.tables', [])

.controller('tableCtrl', [
    '$scope', '$filter'
    ($scope, $filter) ->
        # filter
        $scope.stores = [
            {name: 'Some-Sort-Of-Word-Doc', type: 'Word', views: 292, creation_date: '3/11/14 2:30 PM', access: 'all', type_icon: 'file'}
            {name: 'LinkedIn - HopStack Company Page', type: 'Social', views: 1132, creation_date: '2/19/14 2:00 PM', access: 'all', type_icon: 'cloud'}
            {name: 'index.html', type: 'HTML', views: 17, creation_date: '2/15/14 5:00 AM', access: 'secured', type_icon: 'folder-open'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '3/11/14 2:30 PM', access: 'limited', type_icon: 'cloud'}
            {name: 'American_LCA_Web', type: 'PoweWordrpoint', views: 292, creation_date: '2/19/14 2:00 PM', access: 'all', type_icon: 'file'}
            {name: 'Facebook - HopStack Company Page', type: 'Social', views: 1132, creation_date: '2/15/14 5:00 AM', access: 'all', type_icon: 'cloud'}
            {name: 'help.html', type: 'HTML', views: 17, creation_date: '3/11/14 2:30 PM', access: 'secured', type_icon: 'file'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '2/19/14 2:00 PM', access: 'limited', type_icon: 'cloud'}
            {name: 'You Bet', type: 'Powerpoint', views: 292, creation_date: '2/15/14 5:00 AM', access: 'all', type_icon: 'file'}
            {name: 'Twitter - HopStack Company Feed', type: 'Social', views: 1132, creation_date: '3/11/14 2:30 PM', access: 'all', type_icon: 'cloud'}
            {name: 'Team Process', type: 'HTML', views: 17, creation_date: '2/19/14 2:00 PM', access: 'secured', type_icon: 'folder-open'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '2/15/14 5:00 AM', access: 'limited', type_icon: 'cloud'}
            {name: 'LinkedIn - Apple Company Page', type: 'Social', views: 1132, creation_date: '2/19/14 2:00 PM', access: 'all', type_icon: 'cloud'}
            {name: 'Ohhlahlah', type: 'HTML', views: 17, creation_date: '2/15/14 5:00 AM', access: 'secured', type_icon: 'folder-open'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '3/11/14 2:30 PM', access: 'limited', type_icon: 'cloud'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '2/15/14 5:00 AM', access: 'limited', type_icon: 'cloud'}
            {name: 'Your Personal Files', type: 'HTML', views: 17, creation_date: '3/11/14 2:30 PM', access: 'secured', type_icon: 'folder-open'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '2/15/14 5:00 AM', access: 'limited', type_icon: 'cloud'}
            {name: 'Design Documents', type: 'HTML', views: 17, creation_date: '2/19/14 2:00 PM', access: 'secured', type_icon: 'folder-open'}
            {name: 'Facebook Page Feed', type: 'Social', views: 3327, creation_date: '2/15/14 5:00 AM', access: 'limited', type_icon: 'cloud'}
       ]
        $scope.searchKeywords = ''
        $scope.filteredStores = []
        $scope.row = ''

        $scope.select = (page) ->
            start = (page - 1) * $scope.numPerPage
            end = start + $scope.numPerPage
            $scope.currentPageStores = $scope.filteredStores.slice(start, end)
            # console.log start
            # console.log end
            # console.log $scope.currentPageStores

        # on page change: change numPerPage, filtering string
        $scope.onFilterChange = ->
            $scope.select(1)
            $scope.currentPage = 1
            $scope.row = ''

        $scope.onNumPerPageChange = ->
            $scope.select(1)
            $scope.currentPage = 1

        $scope.onOrderChange = ->
            $scope.select(1)
            $scope.currentPage = 1            


        $scope.search = ->
            $scope.filteredStores = $filter('filter')($scope.stores, $scope.searchKeywords)
            $scope.onFilterChange()

        # orderBy
        $scope.order = (rowName)->
            if $scope.row == rowName
                return
            $scope.row = rowName
            $scope.filteredStores = $filter('orderBy')($scope.stores, rowName)
            # console.log $scope.filteredStores
            $scope.onOrderChange()

        # pagination
        $scope.numPerPageOpt = [3, 5, 10, 20]
        $scope.numPerPage = $scope.numPerPageOpt[2]
        $scope.currentPage = 1
        $scope.currentPageStores = []
        
        $scope.changeView = (view)->
            $location.path(view)
    
        $scope.checkModel = {
            list: false,
            grid: false,
            active: true
        };
    
        $scope.isCollapsed = true

        # init
        init = ->
            $scope.search()
            $scope.select($scope.currentPage)
        init()
])