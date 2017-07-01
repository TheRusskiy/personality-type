'use strict';

angular.module("customer").factory('SweetAlert', ['$window', function SweetAlert($window) {
    return $window.swal;
  }]);
