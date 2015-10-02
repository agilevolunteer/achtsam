gulp = require('gulp')
stylus = require('gulp-stylus')
clean = require('gulp-clean')
argv = require("yargs").argv
shell = require("gulp-shell")
changed = require("gulp-changed")
browserSync = require('browser-sync').create()

dist = 'dist/'
if argv._[0] is "develop"
  dist = 'development/wordpress/wp-content/'

childTheme = dist + 'themes/achtsam-child'
parentTheme = dist + 'themes/iexcel'
toolkit = dist + 'plugins/templatesnext-toolkit'

gulp.task "init:child", ->
  return gulp.src(["achtsam-child/**/*"])
    .pipe(changed(childTheme))
    .pipe(gulp.dest(childTheme))

gulp.task "init:parent", ->
  return gulp.src(["iexcel/**/*"])
    .pipe(gulp.dest(parentTheme))

gulp.task "init:toolkit", ->
  return gulp.src(["templatesnext-toolkit/**/*"])
    .pipe(changed(toolkit))
    .pipe(gulp.dest(toolkit))

gulp.task "styles", ->
  return gulp.src(["achtsam-child/style.styl"])
    .pipe(stylus())
    .pipe(gulp.dest(childTheme))

gulp.task "clean", ->
  return gulp.src('dist', {read: false})
    .pipe(clean());

gulp.task "sync", ->
  browserSync.init({
    proxy: "vagrantpress.dev"
    files: [
      childTheme+"/**/*"
    ]
    server: false
  })

gulp.task "watch", ->
  gulp.watch ["./achtsam-child/**/*.styl"], ["styles"]
  gulp.watch ["./achtsam-child/**/*"], ["init:child"]
  gulp.watch ["./templatesnext-toolkit/**/*"], ["init:toolkit"]



gulp.task "default", ["styles", "init:parent", "init:child", "init:toolkit"]
gulp.task "develop", ["default", "watch", "sync"]