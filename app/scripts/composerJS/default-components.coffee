#
# Created with HopStack.
# User: thinq4yourself
# Date: 2014-09-05
# Time: 10:07 PM
# To change this template use Tools | Templates.
#


angular.module 'builder.components', ['builder', 'validator.rules']

.config ['$builderProvider', ($builderProvider) ->
    # ----------------------------------------
    # TSearchResultWidget - A Results widget (using external templates)
    # ----------------------------------------
    $builderProvider.registerComponent 'TSearchResultWidget',
        group: 'Default'
        label: 'Results Widget'
        description: 'filename'
        placeholder: 'content_type'
        required: no
        templateUrl: 'views/composerJS/builder/resultsTemplate.html'
        popoverTemplateUrl: 'views/composerJS/builder/resultsConfig.html'

    # ----------------------------------------
    # TSearchPagerWidget - A Pager widget (using external templates)
    # ----------------------------------------
    $builderProvider.registerComponent 'TSearchPagerWidget',
        group: 'Default'
        label: 'Pager Widget'
        description: '5'
        placeholder: '500'
        required: no
        validationOptions: [
            {label: 'default', rule: '/.*/'}
            {label: 'First/Last', rule: '[number]'}
            {label: 'Jump', rule: '[email]'}
        ]
        templateUrl: 'views/composerJS/builder/pagerTemplate.html'
        popoverTemplateUrl: 'views/composerJS/builder/pagerConfig.html'

    # ----------------------------------------
    # TSearchPagerWidget - A Pager widget (using inline templates)
    # TODO: move templates into indy views (composerJS/builder/...)
    # ----------------------------------------
    $builderProvider.registerComponent 'TSearchAutocompleteWidget',
        group: 'Default'
        label: 'Autocomplete Widget'
        description: 'An autocomplete widget for searching'
        placeholder: 'Search for a State...'
        required: no
        #arrayToText: yes
        template:
            """
            <div class="form-group" data-ng-controller="TypeaheadCtrl">
                <label for="{{formName+index}}" class="col-md-3 control-label" ng-class="{'fb-required':required}">{{label}}</label>
                <div class="col-md-8">
                    <input type="text" 
                           ng-model="selected"
                           typeahead="state for state in states | filter:$viewValue | limitTo:8"
                           class="form-control"
                           placeholder="Search">
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
                <div class="checkbox">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        Required
                    </label>
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
    # AdvancedCalendarWidget - A Calendar widget (using inline templates)
    # TODO: move templates into indy views (composerJS/builder/...)
    # ----------------------------------------
    $builderProvider.registerComponent 'AdvancedCalendarWidget',
        group: 'Default'
        label: 'Calendar Widget'
        description: 'An date selector widget'
        placeholder: '...'
        required: no
        #arrayToText: yes
        template:
            """
            <div class="form-group" data-ng-controller="DatepickerCtrl">
                <label for="{{formName+index}}" class="col-md-3 control-label" ng-class="{'fb-required':required}">{{label}}</label>
                <div class="col-md-8">
                    <div class="input-group ui-datepicker">
                        <input type="text" 
                               class="form-control"
                               datepicker-popup="{{format}}"
                               ng-model="dt"
                               is-open="opened"
                               min="minDate"
                               max="'2015-06-22'"
                               datepicker-options="dateOptions" 
                               date-disabled="disabled(date, mode)"
                               ng-required="true" 
                               close-text="Close">
                        <span class="input-group-addon" ng-click="open($event)"><i class="fa fa-calendar"></i></span>
                    </div>
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
                <div class="checkbox">
                    <label>
                        <input type='checkbox' ng-model="required" />
                        Required
                    </label>
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
    # TSearchTagCloudWidget - A Tag Cloud widget (using external templates)
    # ----------------------------------------
    $builderProvider.registerComponent 'TSearchTagCloudWidget',
        group: 'Default'
        label: 'Tag Cloud'
        description: 'documenttype'
        placeholder: '500'
        required: no
        validationOptions: [
            {label: 'default', rule: '/.*/'}
            {label: 'Document Type', rule: '[documentype]'}
            {label: 'Global Account ID', rule: '[globalaccountid]'}
        ]
        templateUrl: 'views/composerJS/builder/tagcloudTemplate.html'
        popoverTemplateUrl: 'views/composerJS/builder/tagcloudConfig.html'

    # ----------------------------------------
    # MetadataDisplayWidget - A Metadata Display widget (using external templates)
    # ----------------------------------------
    $builderProvider.registerComponent 'MetadataDisplayWidget',
        group: 'Default'
        label: 'Metadata Display'
        description: 'documenttype'
        placeholder: '500'
        required: no
        validationOptions: [
            {label: 'default', rule: '/.*/'}
            {label: 'Document Type', rule: '[documentype]'}
            {label: 'Global Account ID', rule: '[globalaccountid]'}
        ]
        templateUrl: 'views/composerJS/builder/metadataTemplate.html'
        popoverTemplateUrl: 'views/composerJS/builder/metadataConfig.html'

        
]

