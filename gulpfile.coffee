gulp = require('gulp')
stylus = require('gulp-stylus')
clean = require('gulp-clean')
argv = require("yargs").argv
shell = require("gulp-shell")
changed = require("gulp-changed")
concat = require("gulp-concat")
wrapper = require("gulp-wrapper")
uglifycss = require("gulp-uglifycss")
gif = require("gulp-if")

browserSync = require('browser-sync').create()

dist = 'dist/'
if argv._[0] is "develop"
  dist = 'development/wordpress/wp-content/'

childTheme = dist + 'themes/achtsam-child'
parentTheme = dist + 'themes/iexcel'
toolkit = dist + 'plugins/templatesnext-toolkit'

gulp.task "init:child", ->
  return gulp.src(["achtsam-child/**/*.{css,php,js,mo}"])
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
  return gulp.src(["iexcel/style.css","achtsam-child/style.styl"])
    .pipe(gif(/[.]styl$/, stylus()))
  .pipe(uglifycss())
  .pipe(concat("style.css"))
  .pipe(wrapper({
      header: """
/*
 Theme Name:   achtsam miteinander generated
 Theme URI:    http://agilevolunteer.com/achtsam-miteinander/
 Description:  achtsam-miteinander.de
 Author:       agilevolunteer
 Author URI:   http://agilevolunteer.com
 Template:     iexcel
 Version:      1.0.0
 License:      MIT
 Text Domain: i-excel
*/

"""
    }))
  .pipe(gulp.dest(childTheme))

gulp.task "clean", ->
  return gulp.src('dist', {read: false})
    .pipe(clean());

gulp.task "sync", ->
  browserSync.init({
    proxy: "vagrantpress.dev"
    files: [
      childTheme+"/**/*",
      toolkit+"/**/*"
    ]
    server: false
  })

gulp.task "watch", ->
  gulp.watch ["./achtsam-child/**/*.styl"], ["styles"]
  gulp.watch ["./achtsam-child/**/*"], ["init:child"]
  gulp.watch ["./templatesnext-toolkit/**/*"], ["init:toolkit"]



gulp.task "default", ["styles", "init:parent", "init:child", "init:toolkit"]
gulp.task "develop", ["default", "watch", "sync"]