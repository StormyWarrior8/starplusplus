module.exports = function($http, $q) {
  var baseHost, githubAccessToken;
  baseHost = "https://api.github.com";
  githubAccessToken = void 0;
  return {
    setAccessToken: function(accessToken) {
      return githubAccessToken = accessToken;
    },
    getStars: function() {
      var deferred, promise;
      deferred = $q.defer();
      promise = $http({
        method: "GET",
        url: baseHost + "/user/starred",
        params: {
          access_token: githubAccessToken
        }
      });
      promise.success(function(data, status, headers, config) {
        var link;
        if (link) {
          link = headers("Link").split(",");
          link = link[link.length - 1].split(">;")[0].split("=");
          link = link[link.length - 1];
          console.log(link);
        }
        return deferred.resolve(data);
      });
      promise.error(function(data, status, headers, config) {
        return deferred.reject(data);
      });
      return deferred.promise;
    }
  };
};
