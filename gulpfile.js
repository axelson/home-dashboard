var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('default', function() {
});

gulp.task('sass', function() {
    gulp.src('./scss/*.scss')
        .pipe(sass())
        .pipe(gulp.dest('./public/stylesheets'));
});
