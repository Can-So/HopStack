'use strict';

angular.module('app', [
    # Angular modules
    'ngRoute'
    'ngAnimate'
    'ngMap'

    # 3rd Party Modules
    'ui.bootstrap'
    'easypiechart'
    'mgo-angular-wizard'
    'textAngular'
    'ui.tree'
    'ngTagsInput'
    'angular-intro'

     # UI modules
    'app.ui.ctrls'
    'app.ui.directives'
    'app.ui.services'
    'app.ui.map'
    'app.ui.form.ctrls'
    'app.ui.form.directives'

    # Custom modules
    'app.controllers'
    'app.directives'
    'app.localization'
    'app.nav'
    'app.form.validation'
    'app.tables'
    'app.task'
    'app.chart.ctrls'
    'app.chart.directives'
    'app.page.ctrls'

    # ComposerJS UI builder modules
    'composerJS.control-list'        # the left side controls for the page builer (currently accordion)
    'composerJS.demo'                # builder example for the demo


])
    
.config([
    '$routeProvider'
    ($routeProvider) ->

        routes = [
            'composerJS', 'composerJS/builder', 'composerJS/preview', 'composerJS/save', 'composerJS/builder/template', 'composerJS/builder/popupTemplate'
            '404', '500'
            'ui/typography', 'ui/buttons', 'ui/icons', 'ui/grids', 'ui/widgets', 'ui/components', 'ui/timeline', 'ui/nested-lists', 'ui/pricing-tables', 'ui/maps'
            'docs/docs', 'docs/repo', 'docs/github'
            'tables/static', 'tables/dynamic', 'tables/responsive', 'tables/responsive-filters'
            'forms/elements', 'forms/layouts', 'forms/validation', 'forms/wizard'
            'pages/blank', 'pages/forgot-password', 'pages/invoice', 'pages/lock-screen', 'pages/profile', 'pages/signin', 'pages/signup'
            'mail/compose', 'mail/inbox', 'mail/single'
            'tasks/tasks'
        ]

        setRoutes = (route) ->
            url = '/' + route
            config =
                templateUrl: 'views/' + route + '.html'

            $routeProvider.when(url, config)
            return $routeProvider

        routes.forEach( (route) ->
            setRoutes(route)
        )
        $routeProvider
            .when('/', { redirectTo: '/dashboard'} )
            .when('/composer.html', { redirectTo: '/composerJS/builder'} )
            .when('/404', { templateUrl: 'views/404.html'} )
            .otherwise( redirectTo: '/404' )
])
