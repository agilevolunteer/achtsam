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
imagemin = require('gulp-imagemin')
pngquant = require('imagemin-pngquant')
imageminMozjpeg = require('imagemin-mozjpeg')
imageop = require('gulp-image-optimization')
rev = require("gulp-rev")
jpegoptim = require('imagemin-jpegoptim')

browserSync = require('browser-sync').create()

dist = 'dist/'
if argv._[0] is "develop"
  dist = 'development/wordpress/wp-content/'

childTheme = dist + 'themes/achtsam-child'
childStyle = childTheme + '/style'
parentTheme = dist + 'themes/iexcel'
toolkit = dist + 'plugins/templatesnext-toolkit'

gulp.task "init:child", ->
  return gulp.src(["achtsam-child/**/*.{php,mo}"])
    .pipe(changed(childTheme))
    .pipe(gulp.dest(childTheme))

gulp.task "init:parent", ->
  return gulp.src(["iexcel/**/*"])
    .pipe(gulp.dest(parentTheme))

gulp.task "init:toolkit", ->
  return gulp.src(["templatesnext-toolkit/**/*"])
    .pipe(changed(toolkit))
    .pipe(gulp.dest(toolkit))

gulp.task "scripts", ->
  return gulp.src([
      "vendor/**/*.js",
      "achtsam-child/scripts/*.js"
    ])
    .pipe(concat("achtsam.js"))
    .pipe(gulp.dest(childTheme + "/scripts"))

gulp.task "styles", ->
  return gulp.src([
      "iexcel/style.css",
      "achtsam-child/style.styl"
      "achtsam-child/**/*.css",
      "vendor/**/*.css",

  ])
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
  .pipe(gulp.dest(childStyle))


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
    server: false,
    open: false
  })

gulp.task "watch", ->
  gulp.watch ["./achtsam-child/**/*.{styl,css}"], ["styles"]
  gulp.watch ["./achtsam-child/**/*.{js,coffee}"], ["scripts"]
  gulp.watch ["./achtsam-child/**/*.{php,mo}"], ["init:child"]
  gulp.watch ["./templatesnext-toolkit/**/*"], ["init:toolkit"]

gulp.task "rev", ["styles", "scripts"], ->
  return gulp.src(childTheme+"/**/*.{css,js}")
    .pipe(rev())
    .pipe(gulp.dest(childTheme))
    .pipe(rev.manifest())
    .pipe(gulp.dest(childTheme))

gulp.task 'images', ->
  return gulp.src('assets/**/*')
    .pipe(imagemin({
      progressive: true
      svgoPlugins: [{removeViewBox: false}]
      optimizationlevel: 4
      use: [
        pngquant()
        jpegoptim({
          progressive: true
          max: 30
        })
      ]
    }))
    .pipe(gulp.dest(dist))

gulp.task "default", ["rev", "init:parent", "init:child", "init:toolkit"]
gulp.task "init:dev", ["styles", "scripts", "init:parent", "init:child", "init:toolkit"]
gulp.task "develop", ["init:dev", "watch", "sync"]