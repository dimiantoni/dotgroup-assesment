// serviceBase consome os serviços da API
var serviceBase = 'http://localhost/teste-tecnico/teste-4/svr/api/';

angular.module("controleTarefas", ['ng-sortable']).controller("controleTarefasCtrl", function ($scope, $http){

	$scope.app = "Controle de Tarefas";
	$scope.tarefas = [];
	$scope.editar = [];
	$scope.orig = angular.copy($scope.editar);
	$scope.adicionarTarefa = function (tarefa) {
		$http.post(serviceBase + 'Tasks/insertTask', tarefa).success(function(data){
			delete $scope.tarefa;
			listarTarefas();
		});
	};

	var listarTarefas = function(){
		$http.get(serviceBase + 'Tasks/allTasks').success(function(data, status){
			$scope.tarefas = data;
		})
	}

	$scope.classe = "selecionado";
	$scope.apagarTarefas = function(tarefas){
		$scope.tarefas = tarefas.filter( function(tarefa){
			if(tarefa.selecionado){
				$http.post(serviceBase + 'Tasks/removeTask', tarefa.id_task).success(function(data){
					delete $scope.tarefas;
					listarTarefas();
				});
			}
		});
	};

	$scope.sync = {};
    $scope.sync = function(tarefas){
        syncServer(tarefas);
    };

    function syncServer(tarefas){
		$http.post(serviceBase + 'Tasks/syncServer', tarefas).success(function(){
		});
	}

	$scope.edit = {};
	$scope.edit = function (tarefa,editar) {
		$scope.editar.push(angular.copy(tarefa));
	};

	$scope.editarTarefa = function (editar) {
		$http.put(serviceBase + 'Tasks/editTask', editar).success(function(data){
			resetScope();
			listarTarefas();
			$('#editTarefa').modal('hide');
		});
	};

  	function resetScope(){
    	$scope.editar = angular.copy($scope.orig);
  	};

  	$scope.fecharResetarEdit = function (){
  		resetScope();
  		$('#editTarefa').modal('hide');
  	}

	//Chamada para o modal de cadastro
	$('#addTarefa').on('shown.bs.modal', function () {
			$('#addTarefa').focus();
			listarTarefas();
	});

	//Chamada para o modal de edição
	$('#editTarefa').on('shown.bs.modal', function () {
			$('#editTarefa').focus();
			listarTarefas();
	});

	listarTarefas();
});