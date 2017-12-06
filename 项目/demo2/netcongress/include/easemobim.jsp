<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.bean.*" %>
<%
UserInterface user = (UserInterface)request.getAttribute("currentUser");
if( user==null ){
	return;
}
EasemobIMUser imUser = user.getIMUser();
String easemobUser="";
String easemobPass="";
String headPic="";
String easemobName="";
if( imUser!=null){
	easemobUser = imUser.getUsername();
	easemobPass = imUser.getPassword();
	headPic = user.getLogo();
	easemobName = user.getUserName();
}
%>
<script>
	var easemobUser = '<%=easemobUser%>';
	var easemobPass = '<%=easemobPass%>';
	var easemobHead = '<%=headPic==null?"":headPic%>';
	var easemobName = '<%=easemobName%>';
</script>

<div id="chat-container" class="" ng-app="ngChatApp">
	<div style="width:900px;margin:auto;position:relative;" ng-controller="ngChatCtrl">
	<div id="chatEle"></div>
	<div id="chat" class="{{onChat?'show':''}}">
		<div class="sidebar">
			<div class="m-card">
				<header>
					<img ng-if="!user.img" class="avatar" width="40" height="40"
						ng-src="/static/images/personal_center/user.png">
					<img ng-if="user.img" class="avatar" width="40" height="40" 
						ng-src="/upload/headpic/{{user.img}}">	
					<p class="name" ng-bind="user.name">Coffce</p>
				</header>
				<footer>
					<input class="search" ng-model="filterKey" placeholder="查找..."
							ng-change="search()" />
				</footer>
			</div>
			<!--v-component-->
			<div class="m-list">
				<ul>
					<li ng-repeat="v in userList | search:filterKey track by $index" class="{{session.userId===v.id?'active':''}}"  ng-click="select(v.id)">
					<img ng-if="!v.img" class="avatar" width="30" height="30" 
						ng-src="/static/images/personal_center/user.png">
					<img ng-if="v.img" class="avatar" width="30" height="30"
						alt="{{v.name}}" ng-src="/upload/headpic/{{v.img}}">
					<p class="name">{{v.name}}</p>
					
					<a href="javascript:;" ng-click="remove(v.id)" class="close">
					<i class="fa fa-remove"></i>
					</a>
					<a ng-if="v.newCount" href="javascript:;" class="m-new">
						{{v.newCount}}
					</a>
					</li>
				</ul>
			</div>
			<!--v-component-->
		</div>
		<div class="m-right">
			<div class="m-brief {{hasBrief?'show':''}}">
				{{birefInfo.error}}
				<div ng-if="briefInfo.error">
					{{briefInfo.error}}
				</div>
				<div ng-if="briefInfo.user_type == 'school' ">
					<div class="caption">主办单位</div>
					<dl>
						<dt><i class="fa fa-home" aria-hidden="true"></i>名称</dt>
						<dd>{{briefInfo.school_name}}</dd>
						<dt><i class="fa fa-phone-square" aria-hidden="true"></i>电话</dt>
						<dd>{{briefInfo.contact_tel}}</dd>
						<dt><i class="fa fa-envelope" aria-hidden="true"></i>邮箱</dt>
						<dd>{{briefInfo.email}}</dd>
						<dt><i class="fa fa-qq" aria-hidden="true"></i>QQ号码</dt>
						<dd>{{briefInfo.bind_qq}}</dd>
					</dl>
					<div class="more">
						<a href="/jobfair/school.do?id={{briefInfo.school_id}}" target="_blank">详细信息&gt;&gt;</a>
					</div>
				</div>
				<div ng-if="briefInfo.user_type == 'company' ">
					<div class="caption">企业信息</div>
					<dl>
						<dt><i class="fa fa-home" aria-hidden="true"></i>公司名称</dt>
						<dd>{{briefInfo.company_name}}</dd>
						<dt><i class="fa fa-phone-square" aria-hidden="true"></i>联系电话</dt>
						<dd>{{briefInfo.contact_tel}}</dd>
						<dt><i class="fa fa-envelope" aria-hidden="true"></i>电子邮箱</dt>
						<dd>{{briefInfo.email}}</dd>
						<dt><i class="fa fa-qq" aria-hidden="true"></i>QQ号码</dt>
						<dd>{{briefInfo.bind_qq}}</dd>
					</dl>
					<div class="more">
						<a href="/jobfair/company.do?id={{briefInfo.company_id}}" target="_blank">详细信息&gt;&gt;</a>
					</div>
				</div>
				<div ng-if="briefInfo.user_type == 'student' ">
					<div class="caption">简历信息</div>
					<dl>
						
						<dd>姓名：{{briefInfo.name}}</dd>
						
						<dd>年龄：{{briefInfo.age}}</dd>
						
						<dd>手机：{{briefInfo.contact_tel}}</dd>
						
						<dd>邮箱：{{briefInfo.contact_email}}</dd>
						
						<dd>QQ：{{briefInfo.bind_qq}}</dd>
						
						<dd>学历：{{briefInfo.educations}}</dd>
						
						<dd>专业：{{briefInfo.profession}}</dd>
						
						<dd>学校：{{briefInfo.school_name}}</dd>
					</dl>
					<div class="more">
						<a href="javascript:;" ng-click="view_resume( briefInfo.student_id  )">查看简历&gt;&gt;</a>
					</div>
				</div>
				<div ng-if="briefInfo.order_id">
					<div class="caption">应聘岗位</div>
					<dl>
						<dd>职位：
						<a href="https://dep.211zph.com/jobfair/job.do?id={{briefInfo.job_id}}" target="_blank">
						{{briefInfo.job_name}}
						</a>
						</dd>
						<dd>类型：{{briefInfo.view_job_type}}</dd>
						<dd>学历：{{briefInfo.view_job_education}}</dd>
						<dd>地点：{{briefInfo.view_job_area}}</dd>
						<dd>薪资：{{briefInfo.view_job_money}}</dd>
					</dl>
				</div>
				<div ng-if="briefInfo.view_id">
					<div class="caption">面试岗位</div>
					<dl>
						<dd>职位：
						<a href="https://dep.211zph.com/jobfair/job.do?id={{briefInfo.view_job_id}}" target="_blank">
						{{briefInfo.view_job_name}}
						</a>
						</dd>
						<dd>类型：{{briefInfo.view_job_type}}</dd>
						<dd>学历：{{briefInfo.view_job_education}}</dd>
						<dd>地点：{{briefInfo.view_job_area}}</dd>
						<dd>薪资：{{briefInfo.view_job_money}}</dd>
					</dl>

					</dl>
				</div>
			</div>
		</div>
		<div class="m-main">
			<div class="m-message">
				<ul>
					<!--v-for-start-->
					<li ng-repeat="item in session.messages track by $index">
						<p class="time">
							<span>{{filters.time(item.date) }}</span>
						</p>
						<div class="m-main {{item.self?'self':''}}">
							<img class="avatar" width="30" height="30"
								ng-src="{{filters.avatar(item)}}" />
							<div class="text">{{item.text}}</div>
						</div>
						
						<repeatfinish link="renderFinish();"></repeatfinish>
					</li>
					<!--v-for-end-->
				</ul>
			</div>
			<!--v-component-->
			<div class="m-bar">
				<a href="javascript:;" ng-click="doCall()" class="btn-video">
					<i class="fa fa-video-camera" aria-hidden="true"></i>
					开始视频面试
				</a>
			</div>
			<div class="m-text">
				<textarea ng-keyup="chat.keyup($event)" id="chat-m-text-textarea" placeholder="按  Enter 发送" ng-model="inputText"></textarea>

				<button class="m-control chat-close" ng-click="chat.close()">关闭</button>
				<button class="m-control chat-send" ng-click="chat.send()">发送</button>
			</div>
			<!--v-component-->
		</div>

	</div><!-- chat -->
	<div id="video" class="{{onVideo?'show':''}}">
		<%-- 
		<div class="v-left">
			<div class="content">
				左栏内容
			</div>
		</div>
		--%>
		<div class="v-right">
			<div class="video-c">
			<div class="bigVideo" id="bigVideo">
				<video id="remoteVideo" autoplay="autoplay"></video>
				<div class="smallVideo">
					<video id="localVideo" autoplay="autoplay"></video>
				</div>
			</div>
			</div>
			<div class="v-control">
				<button class="fullVideo" ng-click="fullVideo()" title="全屏显示">
					<i class="fa fa-arrows-alt" aria-hidden="true"></i>
				</button>
				<button class="endCall" ng-click="doEndCall()">
					<i class="fa fa-video-camera" aria-hidden="true"></i>
					挂断
				</button>
				<div style="clear:both;"></div>
			</div>
			<%-- 
			<div class="content">
				底栏内容
			</div>
			--%>
		</div>
		<div style="clear:both;"></div>
	</div><!-- video -->
	
	<div ng-if="onRinging" id="onRinging">
		<div class="video-confirm">
			<div class="modal-header">
			</div>
			<div class="modal-body">
				<img ng-if="!videoUser.img" ng-src="/static/images/personal_center/user.png" />
				<img ng-if="videoUser.img" ng-src="/upload/headpic/{{videoUser.img}}" />
				<p>
				{{videoUser.name}}<br/>
				发起视频面试
				</p>
			</div>
			<div class="modal-footer">
				<button ng-click="doEndCall()" class="btn btn-default">拒绝</button>
				<button ng-click="doAcceptCall()" class="btn btn-success btn-default">接受</button>
			</div>
		</div>
	</div><!-- onRinging -->
	
	</div>
	
	<div style="width:100%;margin:auto;position: absolute;top: 0px;" ng-controller="ngInviteCtrl">
	<div id="inviteEle"></div>
	<div id="invite" class="{{onInvite?'show':''}}">
		<div class="modal-header">
			<h6>请选择邀请学生面试职位</h6>
		</div>
		<div class="modal-body">
		<ul>
			<li ng-repeat="item in jobsList" class="radio">
				<label>
				<input type="radio" name="job_id" ng-model="interview.job_id" ng-value="item.job_id" />
				<span>{{item.job_name}}</span>
				<span style="color:green;">{{item.order_id?'[已投简历]':''}}</span>
				</label>
			</li>
		</ul>
		</div>
		<div class="modal-footer">
			<button ng-click="cancelInvite()" class="btn btn-default">取消</button>
			<button ng-click="selectJob()" class="btn btn-success btn-default">确定</button>
		</div>
	</div><!--  invite -->
	</div><!-- ngInviteCtrl -->
	
	<div style="width:100%;margin:auto;position: absolute;top: 0px;" ng-controller="ngSendCtrl">
	<div id="sendEle"></div>
	<div id="send" class="{{onSend?'show':''}}">
		<div class="modal-header">
			<h6>请选择应聘岗位</h6>
		</div>
		<div class="modal-body">
		<ul>
			<li ng-repeat="item in jobsList" class="radio">
				<label>
				<input type="radio" name="job_id" ng-model="interview.job_id" ng-value="item.job_id" />
				<span>{{item.job_name}}</span>
				<span style="color:green;">{{item.view_id?'[通知面试]':''}}</span>
				</label>
			</li>
		</ul>
		</div>
		<div class="modal-footer">
			<button ng-click="cancel()" class="btn btn-default">取消</button>
			<button ng-click="selectJob()" class="btn btn-success btn-default">确定</button>
		</div>
	</div><!--  invite -->
	</div><!-- ngInviteCtrl -->
</div><!-- chat-container -->

<script type="text/javascript" src="/static/easemobjs/json2.js"></script>
<script type="text/javascript" src="/static/easemobjs/browser-polyfill.min.js"></script>

<script type="text/javascript" src="/static/easemobjs/webim.config.js"></script>
<script type="text/javascript" src="/static/easemobjs/strophe-1.2.8.js"></script>
<script type="text/javascript" src="/static/easemobjs/websdk-1.4.8.js"></script>

<script type="text/javascript" >
    if (WebIM.config.isWebRTC) {
        document.write("<script src='/static/easemobjs/adapter.js'><\/script>");
        document.write("<script src='/static/easemobjs/webrtc-1.4.8.js'><\/script>");
    }
</script>

<script type="text/javascript" src="/static/easemobjs/angular.min.js"></script>

<script type="text/javascript" src="/static/easemobjs/netcongress.js" charset="utf-8"></script>
		