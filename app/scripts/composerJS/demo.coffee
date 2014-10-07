##
# Created with HopStack.
# User: thinq4yourself
# Date: 2014-09-08
# Time: 01:02 AM
# To change this template use Tools | Templates.
##

angular.module('composerJS.demo', ['builder', 'builder.components', 'validator.rules'])

.run ['$builder', ($builder) ->
    # ----------------------------------------------------------------------------------------
    # these are the registered components (demo) using external template example
    # ----------------------------------------------------------------------------------------

    # ----------------------------------------
    # Text area
    # ----------------------------------------
    $builder.registerComponent 'alpacaEditFormWidget',
        group: 'Default'
        label: 'Edit Form Widget'
        description: 'description'
        placeholder: 'test - work in progress'
        required: no
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}" class="col-sm-3 control-label" ng-class="{'fb-required':required}">{{label}}</label>
                <div class="col-sm-9">
                    <textarea type="text" ng-model="inputText" validator-required="{{required}}" validator-group="{{formName}}" id="{{formName+index}}" class="form-control" rows='6' placeholder="{{placeholder}}"/>
                    <p class='help-block'>{{description}}</p>
                </div>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>Label</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>Description</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>Placeholder</label>
                    <input type='text' ng-model="placeholder" class='form-control'/>
                </div>
                <div class="checkbox">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        Required</label>
                </div>

                <hr/>
                <div class='form-group'>
                    <input type='submit' ng-click="popover.save($event)" class='btn btn-primary' value='Save'/>
                    <input type='button' ng-click="popover.cancel($event)" class='btn btn-default' value='Cancel'/>
                    <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='Delete'/>
                </div>
            </form>
            """



    # ----------------------------------------
    # select
    # ----------------------------------------
    $builder.registerComponent 'CMISPropertiesDisplayWidget',
        group: 'Default'
        label: 'CMIS Properties'
        description: 'description'
        placeholder: 'CMIS'
        required: no
        options: ['Display CMIS Metadata', 'Off']
        template:
            """
            <div class="form-group">
                <label for="{{formName+index}}" class="col-sm-3 control-label">{{label}}</label>
                <div class="col-sm-9">
                    <select ng-options="value for value in options" id="{{formName+index}}" class="form-control"
                        ng-model="inputText" ng-init="inputText = options[0]"/>
                    <p class='help-block'>{{description}}</p>
                </div>
            </div>
            """
        popoverTemplate:
            """
            <form>
                <div class="form-group">
                    <label class='control-label'>Label</label>
                    <input type='text' ng-model="label" validator="[required]" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>Description</label>
                    <input type='text' ng-model="description" class='form-control'/>
                </div>
                <div class="form-group">
                    <label class='control-label'>Options</label>
                    <textarea class="form-control" rows="3" ng-model="optionsText"/>
                </div>

                <hr/>
                <div class='form-group'>
                    <input type='submit' ng-click="popover.save($event)" class='btn btn-primary' value='Save'/>
                    <input type='button' ng-click="popover.cancel($event)" class='btn btn-default' value='Cancel'/>
                    <input type='button' ng-click="popover.remove($event)" class='btn btn-danger' value='Delete'/>
                </div>
            </form>
            """
            
]

    # ----------------------------------------------------------------------------------------
    # This the composerJS builder controller - you can't do much without it ...
    #   needs to be renamed when demo done
    # ----------------------------------------------------------------------------------------

.controller 'DemoController', ['$scope', '$builder', '$validator', ($scope, $builder, $validator) ->

    # ----------------------------------------------------------------------------------------
    # Pre-register any components to the View (content area) - sample is provided below,
    #   but we are not using it right now
    # ----------------------------------------------------------------------------------------
    
    # textbox = $builder.addFormObject 'default',
    #    id: 'loaded-input'
    #    component: 'loadedInput'
    #    label: 'Name'
    #    description: 'description'
    #    placeholder: 'placeholder'
    #    required: yes
    #    editable: no
    
    # ----------------------------------------------------------------------------------------
    # Pre-register any components (by name/id) to the View preview
    # ----------------------------------------------------------------------------------------
    # $builder.addFormObject 'default',
    #    component: 'loadedInput'

    # ----------------------------------------------------------------------------------------
    # This is the listener for the component Config scope rendering ( ng-model="isShowScope" ) 
    # TODO: json CRUD reverse engineer for devs/hackers
    # ----------------------------------------------------------------------------------------
    $scope.form = $builder.forms['default']
    
    # this is the listener for the Preview scope rendering ( ng-model="isShowScope" ) 
    #formObjectId: default value

    # builder defaults - form values (in preview) - user's input value
    $scope.input = []
    $scope.defaultValue = {}
    
    # ----------------------------------------------------------------------------------------
    # This is to set any default values in the Pre-register components in the View preview, 
    #    by component name/id
    # ----------------------------------------------------------------------------------------

    # $scope.defaultValue[loaded-input.id] = 'default value'

    # ----------------------------------------------------------------------------------------
    # This is the save & publish process - set any error or success messages to the user or to the log
    # ----------------------------------------------------------------------------------------
    # $scope.submit = ->
    #    $validator.validate $scope, 'default'
    #    .success -> console.log 'success'
    #    .error -> console.log 'error'
]


    # ----------------------------------------------------------------------------------------
    # These are the component controllers used in the composerJS DEMO ...
    #   can be moved out of here when DEMO over
    # ----------------------------------------------------------------------------------------

.controller('NotifyCtrl', [
    '$scope', 'logger'
    ($scope, logger) ->
        $scope.notify = (type)->
            switch type
                when 'save-publish' then logger.log("Successfully saved & published your template") 
                when 'save-scope' then logger.log("Saved your content area settings (scope)")
                when 'success' then logger.logSuccess("Well done! You successfully completed this step")
                when 'warning' then logger.logWarning("Warning! Best check your self, you're not looking too good")
                when 'error' then logger.logError("Oh snap! Change a few things up and try submitting again")
])


    # ----------------------------------------------------------------------------------------
    # These are the individual component controllers used in the composerJS View builder ...
    #   can be moved out of here into ./ComposerCtrl.coffee file when demo done
    # ----------------------------------------------------------------------------------------

.controller('PaginationCtrl', [
    '$scope'
    ($scope) ->
        $scope.totalItems = 28
        $scope.currentPage = 2

        $scope.setPage = (pageNo) ->
            $scope.currentPage = pageNo

        $scope.maxSize = 5
        $scope.bigTotalItems = 175
        $scope.bigCurrentPage = 1
])

.controller('TypeaheadCtrl', [
    '$scope'
    ($scope) ->
        $scope.selected = undefined
        $scope.states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Dakota', 'North Carolina', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
])

.controller('DatepickerCtrl', [
    '$scope'
    ($scope) ->
        $scope.today = ->
            $scope.dt = new Date()
        $scope.today()

        $scope.showWeeks = true
        $scope.toggleWeeks = ->
            $scope.showWeeks = ! $scope.showWeeks

        $scope.clear = ->
            $scope.dt = null

        $scope.toggleMin = ->
            $scope.minDate = ( $scope.minDate ) ? null : new Date()
        $scope.toggleMin()

        $scope.open = ($event) ->
            $event.preventDefault()
            $event.stopPropagation()

            $scope.opened = true

        $scope.dateOptions = {
            'year-format': "'yy'"
            'starting-day': 1
        }

        $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'shortDate']
        $scope.format = $scope.formats[0]
])

.controller('TagCloudCtrl', [
    '$scope'
    ($scope) ->
        $scope.tags = ['legal', 'marketing']
])

 .controller('TagCloudCtrl_new', [
     '$scope'
     ($scope) ->
         $scope.facets = [
             { "value": 1 , "text": "Lorem Ipsum"   , "facet_id": "123"    }
             { "value": 4 , "text": "Ipsum Lorem"  , "facet_id": "456"   }
             { "value": 7 , "text": "OneTwilio"      , "facet_id": "123" }
             { "value": 10, "text": "Twoforeo"     , "facet_id": "456"      }
             { "value": 13, "text": "Ipso Lerumio"       , "facet_id": "789"    }
         ]

         $scope.getTagClass = (facet) ->
             switch (facet.facet_id)
                 when '123'   then return 'label label-info'
                 when '456'  then return 'label label-danger'
                 when '123'then return 'label label-success'
                 when '456'   then return 'label label-primary'
                 when '789'     then return 'label label-warning'        
 ])


.controller('ResultsCtrl', [
    '$scope', '$filter'
    ($scope, $filter) ->
        # filter
        $scope.stores = [
            {name: 'ATandT_CZE_Bricks-and-clicks.doc', type: 'Word', views: 292, creation_date: '3/11/14 2:30 PM', access: 'all', type_icon: 'file'}
            {name: 'Contracts Negotation', type: 'Legal', views: 17, creation_date: '2/15/14 5:00 AM', access: 'secured', type_icon: 'folder-open'}
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

