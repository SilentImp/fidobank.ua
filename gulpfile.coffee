gulp        = require 'gulp'
stylus      = require 'gulp-stylus'
jade        = require 'gulp-jade'
coffee      = require 'gulp-coffee'
order       = require 'gulp-order'
imagemin    = require 'gulp-imagemin'
prefix      = require 'gulp-autoprefixer'
minifyCSS   = require 'gulp-minify-css'
concat      = require 'gulp-concat'
uglify      = require 'gulp-uglify'

dev_path =
  jade:   'developer/*.jade'
  images: 'developer/images/**'
  coffee: 'developer/coffee/**'
  stylus: 'developer/stylus/**'

prod_path =
  html:   'production/'
  images: 'production/images/'
  js:     'production/js/'
  css:    'production/css/'

gulp.task('html', ()->
  return gulp.src(dev_path.jade)
    .pipe(jade())
    .pipe(gulp.dest(prod_path.html))
)

gulp.task('css', ()->
  return gulp.src(dev_path.stylus)
    .pipe(stylus())
    .pipe(prefix())
    .pipe(minifyCSS({removeEmpty:true}))
    .pipe(order([
      'reset.css'
      ]))
    .pipe(concat('styles.css'))
    .pipe(gulp.dest(prod_path.css))
)

gulp.task('js', ()->
  return gulp.src(dev_path.coffee)
    .pipe(coffee({bare: true}))
    .pipe(uglify({outSourceMap: true}))
    .pipe(gulp.dest(prod_path.js))
)

gulp.task('images', ()->
  return gulp.src(dev_path.images)
    .pipe(imagemin())
    .pipe(gulp.dest(prod_path.images))
)

gulp.task('watch', ()->
  gulp.watch dev_path.jade,   ['html']
  gulp.watch dev_path.stylus, ['css']
  gulp.watch dev_path.coffee, ['js']
  gulp.watch dev_path.images, ['images']
)

gulp.task 'default', ['html', 'js', 'css', 'images', 'watch']