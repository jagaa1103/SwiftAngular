app.controller('MainCtrl', function (MainService, $scope) {
        console.log("MainCtrl loaded...");
        
        $scope.hello = function(){
           console.log("button is clicked....");
           MainService.helloService();
           alert("haha");
        }
});
