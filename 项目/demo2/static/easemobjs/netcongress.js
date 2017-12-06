var conn = new WebIM.connection({
    isMultiLoginSessions: WebIM.config.isMultiLoginSessions,
    https: typeof WebIM.config.https === 'boolean' ? WebIM.config.https : location.protocol === 'https:',
    url: WebIM.config.xmppURL,
    heartBeatWait: WebIM.config.heartBeatWait,
    autoReconnectNumMax: WebIM.config.autoReconnectNumMax,
    autoReconnectInterval: WebIM.config.autoReconnectInterval,
    apiUrl: WebIM.config.apiURL,
    isHttpDNS: WebIM.config.isHttpDNS,
    isWindowSDK: WebIM.config.isWindowSDK,
    isAutoLogin: true
});
conn.listen({
    onOpened: function ( message ) {          //连接成功回调
        // 如果isAutoLogin设置为false，那么必须手动设置上线，否则无法收消息
        // 手动上线指的是调用conn.setPresence(); 如果conn初始化时已将isAutoLogin设置为true
        // 则无需调用conn.setPresence();  
        console.info("conn ok");
    },  
    onClosed: function ( message ) {
    	console.info("conn closed");
    },         //连接关闭回调
    onTextMessage: function ( message ) {
    	var scope = angular.element('#chatEle').scope();
    	scope.receivedText( message );
    	scope.$apply();
    },    //收到文本消息
    onEmojiMessage: function ( message ) {},   //收到表情消息
    onPictureMessage: function ( message ) {}, //收到图片消息
    onCmdMessage: function ( message ) {
    	console.log( message );
    	if( 'status'==message.action ){
    		
    	}
    },     //收到命令消息
    onAudioMessage: function ( message ) {
    	console.log( "received audio message ");
    },   //收到音频消息
    onLocationMessage: function ( message ) {},//收到位置消息
    onFileMessage: function ( message ) {},    //收到文件消息
    onVideoMessage: function (message) {
    var node = document.getElementById('privateVideo');
    var option = {
            url: message.url,
            headers: {
              'Accept': 'audio/mp4'
            },
            onFileDownloadComplete: function (response) {
                var objectURL = WebIM.utils.parseDownloadResponse.call(conn, response);
                node.src = objectURL;
            },
            onFileDownloadError: function () {
                console.log('File down load error.')
            }
        };
        WebIM.utils.download.call(conn, option);
    },   //收到视频消息
    onPresence: function ( message ) {},       //收到联系人订阅请求、处理群组、聊天室被踢解散等消息
    onRoster: function ( message ) {},         //处理好友申请
    onInviteMessage: function ( message ) {},  //处理群组邀请
    onOnline: function () {
    	console.log("onOnline");
    },                  //本机网络连接成功
    onOffline: function () {
    	console.log("onOffline");
    },                 //本机网络掉线
    onError: function ( message ) {
    	console.log("conn error");
    	console.log( message );
    	msg_alert("错误信息","服务器连接已断开，请关闭多余的浏览器页面后，请刷本新页面！","error",function(){
        	var scope = angular.element('#chatEle').scope();
        	scope.onChat = false;
        	scope.onVideo = false;
        	scope.$apply();
    	});
    },          //失败回调
    onBlacklistUpdate: function (list) {       //黑名单变动
        // 查询黑名单，将好友拉黑，将好友从黑名单移除都会回调这个函数，list则是黑名单现有的所有好友信息
        console.log(list);
    }
});
var IMCall = {
	rtcCall : '',
	init : function(){
		console.log("rtcCall init...");
		this.rtcCall = new WebIM.WebRTC.Call({
		    connection: conn,
		    mediaStreamConstaints: {
		            audio: true,
		            video: true
		    },
		    listener: {
		        onAcceptCall: function (from, options) {
		        	console.log("================ onAcceptCall =========================");
		        	console.log('onAcceptCall::', 'from: ', from, 'options: ', options);
		        	//等待接听
		        },
		        onGotRemoteStream: function (stream) {
		        	console.log("============= onGotRemoteStream =======================");
		            console.log('onGotRemoteStream::', 'stream: ', stream);
		        	var video = document.getElementById('remoteVideo');
		        	video.src = window.URL.createObjectURL(stream);
		        },
		        onGotLocalStream: function (stream) {
		        	console.log("============= onGotLocalStream =========================");
		            console.log('onGotLocalStream::', 'stream:', stream);
		            var video = document.getElementById('localVideo');
		            video.src = window.URL.createObjectURL(stream);
					video.muted=true;
		        },
		        onRinging: function (caller) {
		        	console.log("================== onRinging ============================");
		            console.log('onRinging::', 'caller:', caller);
		        	var scope = angular.element('#chatEle').scope();
		        	scope.byRinging( caller );
		        	scope.$apply();
		        },
		        onTermCall: function (reason) {
		        	console.log("================== onTermCall ============================");
		            console.log('reason:', reason);
		            //console.log( "caller:" + this.getCaller() );
		            //console.log( "callee:" + this.getCallee() );
		            angular.element('#chatEle').scope().byEndCall().$apply();
		            if( 'busy' == reason ){
		            	msg_alert("提示信息","对方忙碌，请稍后再发起视频面试！","face-sad");
		            }else if( 'timeout' == reason ){
		            	msg_alert("提示信息","对方忙碌，请稍后再发起视频面试！","face-sad");
		            }else if( 'decline' == reason ){
		            	msg_alert("提示信息","对方忙碌，请稍后再发起视频面试！","face-sad");
		            }else if( 'success' == reason ){
		            	//msg_alert("提示信息","对方已挂断！","succeed");
		            }
		        },
		        onIceConnectionStateChange: function (iceState) {
		        	console.log("============ onIceConnectionStateChange =====================");
		            console.log('onIceConnectionStateChange::', 'iceState:', iceState);
		            if( 'connected'==iceState){
		            	console.log("connected");
		            }else if('closed'==iceState){
		            	console.log("closed");
		            }else if('checking'==iceState){
		            	console.log("checking");
		            }
		        },
		        onError: function (e) {
		        	console.log("======================== onError =============================");
		        	console.log(e);
		        	if( e.message && e.message.indexOf('callee is not online')>=0 ){
		        		angular.element('#chatEle').scope().doEndCall( function(contact_tel){
		        			msg_alert("提示信息","对方不在线，请致电："+contact_tel+"，预约面试！","face-sad");
		        		}).$apply();
		        		
		        	}
		        }
		     }
		});
	},
	call : function ( callerId, toId ) {
		 this.rtcCall.caller = callerId ;
		 this.rtcCall.makeVideoCall( toId );
	},
	endCall : function () {
		try{
			this.rtcCall.endCall();
		}catch(e){
			console.log("end call");
		}
	},
	acceptCall : function () {
	 	this.rtcCall.acceptCall();
	},
	getCaller : function() {
		return this.rtcCall.caller;
	},
	getCallee : function() {
		return this.rtcCall.callee;
	}
};
var options = { 
	apiUrl: WebIM.config.apiURL,
	user: easemobUser,
	pwd: easemobPass,
	appKey: WebIM.config.appkey
};
if( easemobUser && easemobUser.indexOf('hx_')==0 ){
	conn.open(options);
	IMCall.init();
}else{
	msg_alert("提示信息","未知错误，请与管理员联系！","error");
}
function IM_kefu( id,img,name ){
	var scope = angular.element('#chatEle').scope();
	scope.contact(id,img,name,false);
	scope.$apply();
}
function IM_contact( id,img,name ){
	if( !id || id.indexOf('hx_')!=0 ){
		msg_alert("提示信息","一见面试失败，请与管理员联系！","error");
		return;
	}else if( IMStorage.check()==false ){
		msg_alert("提示信息","您的浏览器不支持此功能！推荐使用360极速浏览器。","warning");
		return;
	}
	$.get("/netcongress/easemobAssist.do?m=checkSendResume&hx="+id,function(data,status){
		if( 'success'!= status ){
			alert( '网络连接失败，请刷新页面' );
			return;
		}
		switch( data ){
			case 'success':
				var scope = angular.element('#chatEle').scope();
				scope.contact(id,img,name);
				scope.$apply();
				break;
			case 'login':
				msg_alert('提示信息','请您登录系统','sad');
				break;
			case 'send':
				//msg_alert('提示信息','请先投递简历！','warning');
				angular.element('#sendEle').scope().send(id,img,name).$apply();
				break;
				break;
			case 'invite':
				angular.element('#inviteEle').scope().invite(id,img,name).$apply();
				break;
			default:
				alert('未知错误，请与管理员联系！');
		}
	});
}
function IM_sendMessage( fromObj , to , message ){
    var id = conn.getUniqueId();                 // 生成本地消息id
    var msg = new WebIM.message('txt', id);      // 创建文本消息
    msg.set({
        msg:message,                  // 消息内容
        to: to ,                          // 接收消息对象（用户id）
        roomType: false,
        ext : fromObj ,
        success: function (id, serverMsgId) {
            console.log('send private text Success');
        }
    });
    msg.body.chatType = 'singleChat';
    conn.send(msg.body);
}
function IM_messagesScorllTop(){
	var m_message = $("#chat .m-message");
	m_message.scrollTop(m_message.find("ul").height());
}
var now = new Date();
var IMStorage = {
	prefix : ['im-u-','im-m-'],	
	session : {id:'',img:'',name:''},
	users : [],
	messages:[],
	initialize: function( user ){
		this.session = user;
	},
	readUserList : function(){
		var users = JSON.parse(localStorage.getItem( this.prefix[0]+this.session.id ));
		if(!users){
			users=[];
		}
		return  users;
	},
	saveUserList : function( userList ){
		if( userList ){
			localStorage.setItem( this.prefix[0]+this.session.id, JSON.stringify( userList ) );
		}
	},
	readMessages : function( sessionId ){
		var messages = JSON.parse(localStorage.getItem( this.prefix[1]+this.session.id+sessionId ));
		if(!messages){
			messages=[];
		}
		return messages;
	},
	saveMessages : function( sessionId , messageList ){
		if( sessionId && messageList ){
			localStorage.setItem(this.prefix[1]+this.session.id+sessionId, JSON.stringify( messageList ) );
		}
	},
	check : function(){
		return localStorage && localStorage.getItem && localStorage.setItem ;
	}
};
$.fn.extend({
    /**
     * ctrl+enter提交表单
     * @param {Function} fn 操作后执行的函数
     * @param {Object} thisObj 指针作用域
     */
    ctrlSubmit:function(fn,thisObj){
        var obj = thisObj || this;
        var stat = false;
        return this.each(function(){
            $(this).keyup(function(event){
                //只按下ctrl情况，等待enter键的按下
                if(event.keyCode == 17){
                    stat = true;
                    //取消等待
                    setTimeout(function(){
                        stat = false;
                    },300);
                }  
                if(event.keyCode == 13 && (stat || event.ctrlKey)){
                    fn.call(obj,event);
                }  
            });
        });
    }
});
/* Ctrl + Emter 发送消息
$(function(){
	$("#chat-m-text-textarea").ctrlSubmit(function(event){
		var scope = angular.element('#chatEle').scope();
		scope.chat.send();
		scope.$apply();
	});
});
*/
var app=angular.module('ngChatApp', []);
app.directive('repeatfinish',function(){
    return {
    	restrict: 'E',
        link: function(scope,element,attr){
            if(scope.$last == true){
               scope.$eval( attr.link );
            }
        }
    }
});
app.filter('search', function () {
    return function (collection, keyname) {  
        var output = [];
        angular.forEach(collection, function (item) {
        	if ( item.name && item.name.indexOf(keyname) != -1) {  
                output.push(item);  
            } 
        });  
        return output;  
    }
});  
app.controller('ngChatCtrl',['$scope','$http','$timeout',function ($scope,$http,$timeout) {
  $scope.currentVideoSession = '';
  $scope.currentVideoSessionName ='';
  //当前视频用户
  $scope.videoUser = {
		  id:'',
		  img:'',
		  name:''
  };
  //接听对话框开关
  $scope.onRinging = false;
  $scope.onChat = false;
  $scope.onVideo = false;
  $scope.renderFinish = function(){
		  IM_messagesScorllTop();
  };
  //我的环信帐号
  $scope.user = {
		  id : easemobUser,
		  img : easemobHead,
		  name : easemobName
  };
  //当前聊天用户
  $scope.sessionUser = {
		  id :'',
		  img :'',
		  name:'',
		  newCount : 0 
  }
  //聊天框左侧用户列表
  $scope.userList = [];
  // 过滤出只包含这个key的会话
  $scope.filterKey ='';
  //当前会话聊天记录
  $scope.session = {
		  userId: '',
		  messages : []
  };
  $scope.filters = {
      avatar: function(e) {
          var t = e.self ? $scope.user : $scope.sessionUser;
          if( t && t.img ){
        	  return '/upload/headpic/'+t.img;
          }else{
        	  return '/static/images/personal_center/user.png';
          }
      },
      time: function(e) {
          return "string" == typeof e && (e = new Date(e)), e.getHours() + ":" + e.getMinutes();
      }
  },
  $scope.init = function(){
	  IMStorage.initialize( $scope.user );
	  $scope.userList = IMStorage.readUserList();
	  if( $scope.userList.length>0 ){
		  if( $scope.userList[0].newCount >0 ){
			  $scope.sessionUser.newCount =0;
			  IMStorage.saveUserList( $scope.userList );
		  }
		  $scope.sessionUser = $scope.userList[0];
		  $scope.session.userId = $scope.sessionUser.id;
		  $scope.session.messages = IMStorage.readMessages( $scope.session.userId );
	  }
  };
  $scope.hasBrief = true;
  $scope.freshBriefInfo = function( hx_user ){
		$http({
			method: 'GET',
			url:'/netcongress/easemobAssist.do?m=briefInfo',
			params : {
				hx : hx_user,
			} 
		}).then(function successCallback(response) {
			var d = response.data;
			if( d.ret == 0 ){
				$scope.hasBrief = true;
				$scope.briefInfo = d.data;
				if( $scope.briefInfo.view_id ){
					$scope.briefInfo.order_id='';
				}
			}else{
				$scope.hasBrief = false;
				$scope.briefInfo.error = d.desc;
			}
		}, function errorCallback(response) {
			msg_alert('错误信息','服务器忙，请稍后再试！！','face-sad');
		});
  };
  $scope.contact = function( id ,img ,name, video ){
		$scope.addUser({
			id : id,
			img : img,
			name : name,
			newCount : 0
		});
		$scope.select( id );
		if( video !== false ){
			$scope.doCall();
		}
  }
  $scope.remove = function( userId ){
	  for( var i=0,len=$scope.userList.length;i<len;i++){
		  if( $scope.userList[i].id == userId ){
			  $scope.userList.splice(i,1);
		  }
	  }
	  IMStorage.saveUserList( $scope.userList );
	  if( $scope.userList.length == 0 ){
		  $scope.onChat=false;
	  }else if($scope.sessionUser.id == userId ){
		  $scope.select( $scope.userList[0].id );
	  }
  };
  $scope.select = function( selectId ){
	  if( $scope.onChat == false){
		  $scope.freshBriefInfo( selectId );
		  $scope.onChat = true;
		  $timeout(function() {  
			  $scope.renderFinish();
		  },500);
	  }
	  if( $scope.session.userId == selectId ){
		  return;
	  }
	  $scope.session = {
			  userId: selectId ,
			  messages : []
	  };
	  $scope.sessionUser = $scope.userList.find(function(elt, i, array) {
  			if( elt.id == selectId ){
  				if( elt.newCount> 0){
  					elt.newCount=0;
  					IMStorage.saveUserList( $scope.userList );
  				}
  				return true;
  			}
  	  });
	  $scope.session.messages = IMStorage.readMessages( selectId );
	  $scope.renderFinish();
	  $scope.freshBriefInfo( selectId );
  };
  $scope.view_resume = function(student_id){
		view_resume( student_id );
  };
  $scope.briefInfo = {
		  error: ''
  };
  $scope.inputText='';
  $scope.chat = {
	  show : function(){
		  $scope.onChat=true;
	  },
	  close : function(){
		  $scope.onChat=false;
	  },
	  keyup : function( e ){
		  var keycode = window.event?e.keyCode:e.which;
          if(keycode==13){
        	  this.send();
          }
	  },
	  send : function(){
		  if( $scope.inputText && $scope.sessionUser.id !='' ){
			  $scope.send( $scope.inputText );
			  $scope.inputText='';
		  }
	  }
  };
  $scope.send = function( msg ){
	  IM_sendMessage( $scope.user, $scope.session.userId , msg );
	  $scope.session.messages.push({
			text: msg,
            date: new Date,
            self: !0
	  });
	  IM_messagesScorllTop();
	  IMStorage.saveMessages($scope.session.userId, $scope.session.messages );
  };
  $scope.addMessage = function( fromId, toId, msg ){
	  if( fromId == $scope.session.userId ){
		  $scope.session.messages.push({
				text: msg,
	            date: new Date,
	            self: fromId===$scope.user.id
		  });
		  IMStorage.saveMessages( fromId,$scope.session.messages);
	  }else{
		  var messageList = IMStorage.readMessages( fromId );
		  messageList.push({
				text: msg,
	            date: new Date,
	            self: fromId===$scope.user.id
		  });
		  IMStorage.saveMessages(fromId, messageList);
	  }
  };
  $scope.addUser = function( user ){
	  if( $scope.sessionUser.id=='' ){
		  $scope.sessionUser = user;
		  $scope.session.userId = user.id;
	  }
	  var u = $scope.userList.find(function(element, index, array) {
		  if( element.id == user.id ){
			  if( !element.newCount ){
				  element.newCount = 0;
			  }
			  if( $scope.sessionUser.id != user.id && user.newCount >0 ){
				  element.newCount += user.newCount;
				  IMStorage.saveUserList( $scope.userList );
			  }
			  return true;
		  }
	  });
	  if( !u ){
			if( $scope.sessionUser.id == user.id ){
				user.newCount=0;
			}
			$scope.userList.push( user );
			IMStorage.saveUserList( $scope.userList );
	  }
  };
  $scope.receivedText = function( message ){
	  /*
	  var fromUser = {
			  id:message.ext.id,
			  img:message.ext.img,
			  name:message.ext.name,
			  newCount:1
	  }
	  */
	  var c = $scope.userList.find(function(element, index, array) {
		  if( element.id == message.from ){
			return true;  
		  }
	  });
	  if( c ){
		  $scope.addUser( c );
		  $scope.addMessage( message.from,message.to, message.data );
		  if( $scope.onChat == false ){
			  $scope.select( c.id );
		  }else if( $scope.sessionUser.id == c.id ){
			  $scope.renderFinish();
		  }
	  }else{
		  $http({
				method: 'GET',
				url:'/netcongress/easemobAssist.do?m=hxUserInfo',
				params : {
					hx : message.from,
				} 
		  }).then(function successCallback(response) {
				var d = response.data;
				if( d.ret == 0 ){
					  var fromUser = d.data;
					  $scope.addUser( fromUser );
					  $scope.addMessage( message.from,message.to, message.data );
					  if( $scope.onChat == false ){
						  $scope.select( fromUser.id );
					  }else if( $scope.sessionUser.id == fromUser.id ){
						  $scope.renderFinish();
					  }
				}else{
					msg_alert('错误信息','未知错误，请联系管理员！！','error');
				}
		  }, function errorCallback(response) {
				msg_alert('错误信息','服务器连接失败，请刷新页面！！','face-sad');
		  });
	  }
  };
  $scope.doCall = function(){
	  var callerId = $scope.user.id;
	  var toId = $scope.sessionUser.id;
	  if( toId ){
		  $scope.send("发起视频面试");
		  try{
			  IMCall.call(callerId, toId);
		  }catch(e){
			return;  
		  }
		  $scope.onVideo = true;
	  }else{
		  msg_alert("提示信息","拨号失败","face-sad");
	  }
  };
  $scope.byRinging = function( caller ){
	  var hx_user = caller.replace( WebIM.config.appkey+'_','').split("@")[0];
	  var c = $scope.userList.find(function(element, index, array) {
		  if( element.id == hx_user ){
			return true;  
		  }
	  });
	  if( c ){
		  $scope.currentVideoSession = c.id;
		  $scope.currentVideoSessionName = c.name;
		  $scope.videoUser = c;
	  	  $scope.onRinging = true ;
	  }else{
			$http({
				method: 'GET',
				url:'/netcongress/easemobAssist.do?m=hxUserInfo',
				params : {
					hx : hx_user,
				} 
			}).then(function successCallback(response) {
				var d = response.data;
				if( d.ret == 0 ){
					$scope.addUser( d.data );
					$scope.currentVideoSession = d.data.id;
					$scope.currentVideoSessionName = d.data.name;
					$scope.videoUser = d.data;
				  	$scope.onRinging = true ;
				}else{
					$scope.doEndCall();
				}
			}, function errorCallback(response) {
				msg_alert('错误信息','服务器连接失败，请刷新页面！！','face-sad');
			});
	  }
  };
  $scope.doAcceptCall = function(){
	  $scope.onChat = true;
	  $scope.onRinging = false;
	  $scope.onVideo = true;
	  $scope.select( $scope.currentVideoSession );
	  IMCall.acceptCall();
  };
  $scope.doEndCall = function( callback ){
	  $scope.send("结束视频面试");
	  $scope.currentVideoSession = '';
	  $scope.onRinging = false;
	  $scope.onVideo = false;
	  IMCall.endCall();
	  if( callback && 'function'==typeof( callback ) ){
		  callback( $scope.briefInfo.contact_tel );  
	  }
	  return $scope;
  };
  $scope.byEndCall = function(){
	  $scope.currentVideoSession = '';
	  $scope.onRinging = false;
	  $scope.onVideo = false;
	  return $scope;
  };
  $scope.fullVideo = function(){
	  var elem = document.getElementById("bigVideo");  
	  requestFullScreen(elem);   
  };
  $scope.init();
  $("#chat-container").addClass("show");
}]);
app.controller('ngSendCtrl',['$scope',
                             '$http',
                             '$timeout',function($scope,$http,$timeout){
	$scope.onSend = false;
	$scope.company = {};
	$scope.interview = {
			job_id:'',
	};
	$scope.jobsList = [{
		job_id :'',
		job_name :''
	}];
	$scope.cancel = function(){
		$scope.onSend = false;
	};
	$scope.selectJob = function(){
		if( $scope.interview.job_id == '' ){
			msg_alert("提示信息","请选择职位！","error");
			return;
		}
		$http({
			method: 'GET',
			url:'/netcongress/easemobAssist.do?m=sendPersonOrder&a=submit',
			params : {
				hx : $scope.company.id,
				job_id : $scope.interview.job_id
			} 
		}).then(function successCallback(response) {
			$scope.onSend = false;
			angular.element('#chatEle').scope().contact($scope.company.id,$scope.company.img,$scope.company.name);
		}, function errorCallback(response) {
			msg_alert('错误信息','服务器忙，请稍后再试！！','face-sad');
		});
	};
	$scope.send = function(id,img,name){
		$scope.company = {
			id:id,
			img:img,
			name:name
		};
		$http({
			method: 'GET',
			url:'/netcongress/easemobAssist.do?m=sendPersonOrder&a=list&hx='+id
		}).then(function successCallback(response) {
			var d = response.data;
			console.log( d );
			if( d.ret==0){
				if( d.data && d.data.length>0 ){
					$scope.jobsList = d.data;
					$scope.onSend = true;
				}else{
					msg_alert('错误信息','请先发布招聘职位！','error');
				}
			}else if(d.desc){
				msg_alert("提示信息","d.desc");
			}else{
				msg_alert('错误信息','服务器忙，请稍后再试！！','face-sad');
			}
		}, function errorCallback(response) {
			msg_alert('错误信息','服务器忙，请稍后再试！','face-sad');
		});
		return $scope;
	}
}]);
app.controller('ngInviteCtrl',[	'$scope',
                               	'$http',
                    			'$timeout',function ($scope,$http,$timeout) {
	$scope.onInvite = false;
	$scope.student = {};
	$scope.interview = {
			job_id:'',
	};
	$scope.jobsList = [{
		job_id :'',
		job_name :''
	}];
	$scope.cancelInvite = function(){
		$scope.onInvite = false;
	};
	$scope.selectJob = function(){
		if( $scope.interview.job_id == '' ){
			msg_alert("提示信息","请选择职位！","error");
			return;
		}
		$http({
			method: 'GET',
			url:'/netcongress/easemobAssist.do?m=inviteInterview&a=submit',
			params : {
				hx : $scope.student.id,
				job_id : $scope.interview.job_id
			} 
		}).then(function successCallback(response) {
			$scope.onInvite = false;
			angular.element('#chatEle').scope().contact($scope.student.id,$scope.student.img,$scope.student.name);
		}, function errorCallback(response) {
			msg_alert('错误信息','服务器忙，请稍后再试！！','face-sad');
		});
	};
	$scope.invite = function(id,img,name){
		$scope.student = {
			id:id,
			img:img,
			name:name
		};
		$http({
			method: 'GET',
			url:'/netcongress/easemobAssist.do?m=inviteInterview&a=list&hx='+id
		}).then(function successCallback(response) {
			var d = response.data;
			if( d.ret==0){
				if( d.data && d.data.length>0 ){
					$scope.jobsList = d.data;
					$scope.onInvite = true;
				}else{
					msg_alert('错误信息','请先发布招聘职位！','error');
				}
			}else if(d.desc){
				msg_alert("提示信息","d.desc");
			}else{
				msg_alert('错误信息','服务器忙，请稍后再试！！','face-sad');
			}
		}, function errorCallback(response) {
			msg_alert('错误信息','服务器忙，请稍后再试！','face-sad');
		});
		return $scope;
	}
}]);
function requestFullScreen(element) {
    var requestMethod = element.requestFullScreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;
    if (requestMethod) {  
        requestMethod.call(element);
    } else if (typeof window.ActiveXObject !== "undefined") {  
        var wscript = new ActiveXObject("WScript.Shell");
        if (wscript !== null) {
            wscript.SendKeys("{F11}");
        }
    }
}