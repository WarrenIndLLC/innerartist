
// Include gulp
var gulp = require('gulp');

// Include Our Plugins
var jshint = require('gulp-jshint');
var less   = require('gulp-less');
var minifyCSS = require('gulp-minify-css');
var path = require('path');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var sourcemaps = require('gulp-sourcemaps');
var browserSync = require('browser-sync');
var autoprefixer = require('gulp-autoprefixer');
var reload      = browserSync.reload;
var minifyHTML = require('gulp-minify-html');

gulp.task('less', function () {
    gulp.src('./application/resources/less/main.less')
        .pipe(less())
        .on('error', function () {
            this.emit('end');
        })
        .pipe(gulp.dest('./assets/css'))
        .pipe(browserSync.reload({stream:true}));
});

gulp.task('html.modals', function() {
    gulp.src('assets/views/modals/*.html')
        .pipe(concat('modals.html'))
        .pipe(minifyHTML())
        .pipe(gulp.dest('assets/views'));
});

gulp.task('scripts.install', function() {
    return gulp.src([
        'application/resources/js/vendor/jquery.js',
        'application/resources/js/vendor/bootstrap.js',
        'application/resources/js/vendor/hammer.js',
        'application/resources/js/vendor/angular.min.js',
        'application/resources/js/vendor/angular-ui-router.js',
        'application/resources/js/vendor/angular-animate.js',
        'application/resources/js/vendor/angular-aria.js',
        'application/resources/js/vendor/angular-material.js',
        'application/resources/js/installer.js'
    ]).pipe(concat('install.min.js'))
      .pipe(gulp.dest('assets/js'))
      .pipe(browserSync.reload({stream:true}));
});


gulp.task('scripts.core', function() {
    return gulp.src([
        'application/resources/js/vendor/jquery.js',
        'application/resources/js/vendor/moment.js',
        'application/resources/js/vendor/bootstrap.js',
        'application/resources/js/vendor/jquery-ui.js',
        'application/resources/js/vendor/hammer.js',
        'application/resources/js/vendor/photoswipe.min.js',
        'application/resources/js/vendor/photoswipe-ui-default.min.js',
        'application/resources/js/vendor/angular.min.js',
        'application/resources/js/vendor/angular-animate.js',
        'application/resources/js/vendor/angular-aria.js',
        'application/resources/js/vendor/angular-material.js',
        'application/resources/js/vendor/angular-upload.js',
        'application/resources/js/vendor/angular-messages.js',
        'application/resources/js/vendor/angular-lazy-image-load.js',
        'application/resources/js/vendor/angular-ui-router.js',
        'application/resources/js/vendor/angular-translate.js',
        'application/resources/js/vendor/angular-translate-url-loader.js',
        'application/resources/js/vendor/angular-lazy-module.js',
        'application/resources/js/vendor/angular-pagination.js',
        'application/resources/js/core/App.js',
        'application/resources/js/core/Routes.js',
        'application/resources/js/core/LocalStorage.js',
        'application/resources/js/core/**/*.js',

        'application/resources/js/dashboard/**/*.js',

        'application/resources/js/vendor/pagination.js',
        'application/resources/js/admin/**/*.js',

        'application/resources/js/vendor/chart.js',
        'application/resources/js/analytics/PromisePolyfill.js',

        'application/resources/js/editor/resources/colors.js',
        'application/resources/js/editor/resources/gradients.js',
        'application/resources/js/vendor/pagination.js',
        'application/resources/js/vendor/file-saver.js',
        'application/resources/js/vendor/spectrum.js',
        'application/resources/js/vendor/scrollbar.js',
        'application/resources/js/vendor/fabric.js',
        'application/resources/js/editor/App.js',
        'application/resources/js/editor/EditorController.js',
        'application/resources/js/editor/Canvas.js',
        'application/resources/js/editor/crop/cropper.js',
        'application/resources/js/editor/crop/cropzone.js',
        'application/resources/js/editor/crop/cropController.js',
        'application/resources/js/editor/basics/RotateController.js',
        'application/resources/js/editor/basics/CanvasBackgroundController.js',
        'application/resources/js/editor/basics/ResizeController.js',
        'application/resources/js/editor/basics/RoundedCornersController.js',
        'application/resources/js/editor/zoomController.js',
        'application/resources/js/editor/TopPanelController.js',
        'application/resources/js/editor/directives/Tabs.js',
        'application/resources/js/editor/directives/PrettyScrollbar.js',
        'application/resources/js/editor/directives/ColorPicker.js',
        'application/resources/js/editor/directives/FileUploader.js',
        'application/resources/js/editor/directives/TogglePanelVisibility.js',
        'application/resources/js/editor/directives/ToggleSidebar.js',
        'application/resources/js/editor/directives/LazyShow.js',
        'application/resources/js/editor/text/Text.js',
        'application/resources/js/editor/text/TextController.js',
        'application/resources/js/editor/text/TextAlignButtons.js',
        'application/resources/js/editor/text/TextDecorationButtons.js',
        'application/resources/js/editor/text/Fonts.js',
        'application/resources/js/editor/drawing/Drawing.js',
        'application/resources/js/editor/drawing/DrawingController.js',
        'application/resources/js/editor/drawing/RenderBrushesDirective.js',
        'application/resources/js/editor/History.js',
        'application/resources/js/editor/Saver.js',
        'application/resources/js/editor/filters/FiltersController.js',
        'application/resources/js/editor/filters/Filters.js',
        'application/resources/js/editor/shapes/SimpleShapesController.js',
        'application/resources/js/editor/shapes/StickersController.js',
        'application/resources/js/editor/shapes/StickersCategories.js',
        'application/resources/js/editor/shapes/SimpleShapes.js',
        'application/resources/js/editor/shapes/Polygon.js',
        'application/resources/js/editor/objects/ObjectsPanelController.js',
        'application/resources/js/editor/objects/ObjectsPanelSortableDirective.js',
        'application/resources/js/editor/EditorUploadsController.js'
    ])
    .pipe(concat('core.min.js'))
    .pipe(gulp.dest('assets/js'))
    .pipe(browserSync.reload({stream:true}));
});


gulp.task('minify', function() {
    gulp.src('assets/js/core.min.js').pipe(uglify()).pipe(gulp.dest('assets/js'));

    gulp.src('assets/css/main.css')
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false,
            remove: false
        }))
        .pipe(minifyCSS({compatibility: 'ie10'}))
        .pipe(gulp.dest('assets/css'));
});

// Watch Files For Changes
gulp.task('watch', function() {
    browserSync({
        proxy: "picturish.dev"
    });

    gulp.watch('application/resources/js/**/*.js', ['scripts.core', 'scripts.install']);
    gulp.watch('application/resources/less/**/*.less', ['less']);
    gulp.watch('assets/views/**', ['html.modals']).on('change', reload);
});

// Default Task
gulp.task('default', ['watch']);