<%@ page language="java" pageEncoding="utf-8"%>
    <div class="container">
        <ul class="breadcrumb">
          <li>
             <a href="./">首页</a> <span class="divider">&gt;</span>
          </li>
          <li class="active">新闻</li>
        </ul>
    </div>
    
    <div class="container border-3A614C">
      <div class="f_carousel pull-left news_board">
				<div id="slide" style="position: relative;"></div>
				<script type="text/javascript">
				            
                $("#slide").jdSlide(
                {width:722,
                height:319,
                pics:[{src:"tmp/banner1.png",href:"#",alt:"",breviary:"#",type:"img"},
                      {src:"tmp/banner2.png",href:"#",alt:"",breviary:"#",type:"img"}]
                })
                </script>      
      </div>    
      <div class="f_news pull-left">
            <ul class="nav nav-tabs" id="newsTab">
              <li class="active"><a href="#new1" data-toggle="tab">新闻</a></li>
              <li><a href="#new2" data-toggle="tab">公告</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="new1">
              	<ul>
                	<li><a href="#">这是新闻消息</a><i class="new-icon"></i></li>
                    <li><a href="#">这是新闻消息是新闻消息</a><i class="new-icon"></i></li>
               		<li><a href="#">这是新闻消息闻消</a><i class="new-icon"></i></li>
                    <li><a href="#">新闻消息新闻消息</a></li>
               		<li><a href="#">这是新是新闻消消息</a></li>
                    <li><a href="#">这是新是消闻消息</a></li>
                    <li><a href="#">这是新是新闻消消息</a></li>
                </ul>
                <a href="" class="pull-right" style="margin-right:20px;"><small>更多&gt;&gt;</small></a>
			  </div>
              <div class="tab-pane" id="new2">
              	<ul>
                	<li><a href="#">这是新闻消息</a><span class="pull-right date">2014-01-02</span></li>
                    <li><a href="#">这是新闻消息是新闻息</a><span class="pull-right date">2014-01-02</span></li>
               		<li><a href="#">这是新闻消息闻消</a><span class=" pull-right date">2014-01-02</span></li>
                    <li><a href="#">新闻消息新闻消息</a><span class=" pull-right date">2014-01-02</span></li>
               		<li><a href="#">这是新是新闻消消息</a><span class=" pull-right date">2014-01-02</span></li>
                    <li><a href="#">这是新是消闻消息</a><span class=" pull-right date">2014-01-02</span></li>
                    <li><a href="#">这是新是新闻消消息</a><span class=" pull-right date">2014-01-02</span></li>
                </ul>
                 <a href="" class="pull-right" style="margin-right:20px;"><small>更多&gt;&gt;</small></a>
              </div>
            </div>
      </div>

    </div>
