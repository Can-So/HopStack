##
# Created with HopStack.
# User: thinq4yourself
# Date: 2014-09-08
# Time: 12:52 AM
# To change this template use Tools | Templates.
##

# yo - the scaffolding tool from Yeoman
# bower - the package management tool
# grunt - the build tool

"use strict"
LIVERELOAD_PORT = 4000
lrSnippet = require("connect-livereload")(port: LIVERELOAD_PORT)

# var conf = require('./conf.'+process.env.NODE_ENV);
mountFolder = (connect, dir) ->
    connect.static require("path").resolve(dir)


# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'

module.exports = (grunt) ->
    require("load-grunt-tasks") grunt
    require("time-grunt") grunt
    
    # configurable paths
    yeomanConfig =
        app: "app"
        dist: "dist"
        lib: "lib/dist" 
        bow: "bower_components"
        test: "test"

    try
        yeomanConfig.app = require("./bower.json").appPath or yeomanConfig.app
    grunt.initConfig
        yeoman: yeomanConfig
        watch:
            coffee:
                files: ["<%= yeoman.app %>/scripts/**/*.coffee"]
                tasks: ["coffee:dist"]

            compass:
                files: ["<%= yeoman.app %>/styles/**/*.{scss,sass}"]
                tasks: ["compass:server"]

            less:
                files: ["<%= yeoman.app %>/styles-less/**/*.less"]
                tasks: ["less:server"]

            livereload:
                options:
                    livereload: LIVERELOAD_PORT

                files: [
                    "<%= yeoman.app %>/index.html"
                    "<%= yeoman.app %>/views/**/*.html"
                    "<%= yeoman.app %>/styles/**/*.scss"
                    "<%= yeoman.app %>/styles-less/**/*.less"
                    ".tmp/styles/**/*.css"
                    "<%= yeoman.app %>/scripts/{,*/}*.js",
                    "{.tmp,<%= yeoman.app %>}/scripts/**/*.js"
                    "<%= yeoman.app %>/images/**/*.{png,jpg,jpeg,gif,webp,svg}"
                ]

        connect:
            options:
                port: 3000
                
                # Change this to '0.0.0.0' to access the server from outside. Use 127.0.0.1 for loal only.
                hostname: "0.0.0.0"

            livereload:
                options:
                    middleware: (connect) ->
                        [lrSnippet, mountFolder(connect, ".tmp"), mountFolder(connect, yeomanConfig.app)]

            test:
                options:
                    middleware: (connect) ->
                        [mountFolder(connect, ".tmp"), mountFolder(connect, "test")]

            dist:
                options:
                    middleware: (connect) ->
                        [mountFolder(connect, yeomanConfig.dist)]

        open:
            server:
                url: "http://localhost:<%= connect.options.port %>"

        clean:
            dist:
                files: [
                    dot: true
                    src: [".tmp", "<%= yeoman.dist %>/*", "!<%= yeoman.dist %>/.git*"]
                ]

            server: ".tmp"

        jshint:
            options:
                jshintrc: ".jshintrc"

            all: ["Gruntfile.js", "<%= yeoman.app %>/scripts/**/*.js"]

        compass:
            options:
                sassDir: "<%= yeoman.app %>/styles"
                cssDir: ".tmp/styles"
                generatedImagesDir: ".tmp/styles/ui/images/"
                imagesDir: "<%= yeoman.app %>/styles/ui/images/"
                javascriptsDir: "<%= yeoman.app %>/scripts"
                fontsDir: "<%= yeoman.app %>/fonts"
                importPath: "<%= yeoman.lib %>/bower_components"
                httpImagesPath: "styles/ui/images/"
                httpGeneratedImagesPath: "styles/ui/images/"
                httpFontsPath: "fonts"
                relativeAssets: true
            dist:
                options:
                    outputStyle: 'compressed'
                    debugInfo: false
                    noLineComments: true
            server:
                options:
                    debugInfo: true
            forvalidation:
                options:
                    debugInfo: false
                    noLineComments: false
        # if you want to use the compass config.rb file for configuration:
        # compass:
        #   dist:
        #     options:
        #       config: 'config.rb'

        less:
            server:
                options:
                    strictMath: true
                    dumpLineNumbers: true
                    sourceMap: true
                    sourceMapRootpath: ""
                    outputSourceFiles: true
                files: [
                    expand: true
                    cwd: "<%= yeoman.app %>/styles-less"
                    src: "main.less"
                    dest: ".tmp/styles"
                    ext: ".css"                    
                ]
            dist:
                options:
                    cleancss: true,
                    report: 'min'
                files: [
                    expand: true
                    cwd: "<%= yeoman.app %>/styles-less"
                    src: "main.less"
                    dest: ".tmp/styles"
                    ext: ".css"                    
                ]


        coffee:
            server:
                options:
                    sourceMap: true
                    # join: true,
                    sourceRoot: ""
                files: [
                    expand: true
                    cwd: "<%= yeoman.app %>/scripts"
                    src: "**/*.coffee"
                    dest: ".tmp/scripts"
                    ext: ".js"
                ]
            dist:
                options:
                    sourceMap: false
                    sourceRoot: ""
                files: [
                    expand: true
                    cwd: "<%= yeoman.app %>/scripts"
                    src: "**/*.coffee"
                    dest: ".tmp/scripts"
                    ext: ".js"
                ]

        useminPrepare:
            html: "<%= yeoman.app %>/index.html"
            options:
                dest: "<%= yeoman.dist %>"
                flow:
                    steps:
                        js: ["concat"]
                        css: ["cssmin"]
                    post: []

        
        # 'css': ['concat']
        usemin:
            html: ["<%= yeoman.dist %>/**/*.html", "!<%= yeoman.dist %>/bower_components/**"]
            css: ["<%= yeoman.dist %>/styles/**/*.css"]
            options:
                dirs: ["<%= yeoman.dist %>"]

        htmlmin:
            dist:
                options: {}
                
                #removeCommentsFromCDATA: true,
                #                    // https://github.com/yeoman/grunt-usemin/issues/44
                #                    //collapseWhitespace: true,
                #                    collapseBooleanAttributes: true,
                #                    removeAttributeQuotes: true,
                #                    removeRedundantAttributes: true,
                #                    useShortDoctype: true,
                #                    removeEmptyAttributes: true,
                #                    removeOptionalTags: true
                files: [
                    expand: true
                    cwd: "<%= yeoman.app %>"
                    src: ["*.html", "views/*.html"]
                    dest: "<%= yeoman.dist %>"
                ]

        
        # Put files not handled in other tasks here
        copy:
            dist:
                files: [
                    expand: true
                    dot: true
                    cwd: "<%= yeoman.app %>"
                    dest: "<%= yeoman.dist %>"
                    src: [
                        "favicon.ico"
                        # bower components that have image and font dependencies
                        "bower_components/font-awesome/css/*"
                        "bower_components/font-awesome/fonts/*"
                        "bower_components/weather-icons/css/*"
                        "bower_components/weather-icons/font/*"

                        "fonts/**/*"
                        "i18n/**/*"
                        "images/**/*"
                        # "styles/bootstrap/**/*"
                        "styles/fonts/**/*"
                        "styles/img/**/*"
                        "styles/ui/images/*"
                        "views/**/*"
                    ]
                ,
                    expand: true
                    cwd: ".tmp"
                    dest: "<%= yeoman.dist %>"
                    src: ["styles/**", "assets/**"]
                ,
                    expand: true
                    cwd: ".tmp/images"
                    dest: "<%= yeoman.dist %>/images"
                    src: ["generated/*"]
                ]

            styles:
                expand: true
                cwd: "<%= yeoman.app %>/styles"
                dest: ".tmp/styles/"
                src: "**/*.css"

        concurrent:
            server: ["coffee:server", "compass:server", "copy:styles"]
            dist: ["coffee:dist", "compass:dist", "copy:styles", "htmlmin"]
            lessServer: ["coffee:server", "less:server", "copy:styles"]
            lessDist: ["coffee:dist", "less:dist", "copy:styles", "htmlmin"]

        cssmin:
            options:
                keepSpecialComments: '0'
            dist: {}    # usemin takes care of that

        concat:
            options:
                separator: grunt.util.linefeed + ';' + grunt.util.linefeed
            dist: {}   # usemin takes care of that

        uglify:
            options:
                mangle: false
                compress:
                    drop_console: true
            dist:
                files:
                    "<%= yeoman.dist %>/scripts/app.js": [".tmp/**/*.js", "<%= yeoman.app %>/scripts/**/*.js"]

        # This is for the awesome Karma runner (https://karma-runner.github.io) 
        karma:
            min:
                configFile: '<%= yeoman.test %>/karma-min.config.coffee'
            source:
                configFile: '<%= yeoman.test %>/karma.config.coffee'


    grunt.registerTask "server", (target) ->
        return grunt.task.run(["build", "open", "connect:dist:keepalive"])  if target is "dist"
        grunt.task.run ["clean:server", "concurrent:server", "connect:livereload", "open", "watch"]

    grunt.registerTask "lessServer", (target) ->
        return grunt.task.run(["lessBuild", "open", "connect:dist:keepalive"])  if target is "dist"
        grunt.task.run ["clean:server", "concurrent:lessServer", "connect:livereload", "open", "watch"]

    grunt.registerTask "build", ["clean:dist", "useminPrepare", "concurrent:dist", "copy:dist", "cssmin", "concat", "uglify", "usemin"]
    grunt.registerTask "lessBuild", ["clean:dist", "useminPrepare", "concurrent:lessDist", "copy:dist", "cssmin", "concat", "uglify", "usemin"]

    grunt.registerTask "default", ["server"]

    grunt.registerTask "heroku:production", ["clean", "less", "mincss", "uglify"]
    grunt.registerTask "heroku:development", ["clean:dist", "useminPrepare", "concurrent:dist", "copy:dist", "cssmin", "concat", "uglify", "usemin"]
    grunt.registerTask "heroku", ["clean:dist", "useminPrepare", "concurrent:dist", "copy:dist", "cssmin", "concat", "uglify", "usemin"]

    # grunt.registerTask "heroku:production", ["clean:dist", "useminPrepare", "concurrent:lessDist", "copy:dist", "cssmin", "concat", "uglify", "usemin"]

    # Test Tasks
    grunt.registerTask "test", ["clean:tests", "jshint", "nodeunit", "stage", "connect:staging", "ghost"]
    grunt.registerTask 'karma', ['karma']