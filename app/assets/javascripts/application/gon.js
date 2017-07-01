'use strict';

angular.module("customer").factory('gon', ['$window', function gon($window) {
    return $window.gon;
  }]);
