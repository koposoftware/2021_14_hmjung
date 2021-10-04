
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<input type="hidden" id="sessionId" value="">


<div class="box direct-chat direct-chat-info full-chat-box">
<div id="video-area" style="margin:auto; width:70%;" >
	<!-- <video  controls class="w-p100">
		<source  type="video/mp4" src="/HanaWinStock\resources\files\advertise\ad\file-20210921_08_52_25.mp4">  
	</video> -->
</div>
	<div class="box-header with-border">
		<h4 class="box-title">실시간 채팅</h4>	
				<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chat" id="close-chat" onclick="removechatbox()">
							<i class="fa fa-remove"></i>
						</button>
	</div>

	<!-- /.box-header -->
	<div class="box-body" style="height:400px;">

		<!-- Conversations are loaded here -->
		<div class="direct-chat-messages" id="direct-chat" style="height: 80%;">
			<!-- Message. Default to the left -->

			<!--/.direct-chat-messages-->

			<!-- /.direct-chat-pane -->
		</div>
		<!-- /.box-body -->
		<div class="box-footer" style="height:100px;">

			<div class="input-group">
				<input type="text" name="message" id="chat" placeholder="메시지를 작성하세요" class="form-control">
				<div class="input-group-addon">
					<div class="align-self-end gap-items">
					<!-- 	<span class="publisher-btn file-group"> <i class="fa fa-paperclip file-browser"></i> <input type="file">
						</span>
						<a class="publisher-btn" href="#">
							<i class="fa fa-smile-o"></i>
						</a> -->
						<a id="send-msg" class="publisher-btn">
							<i class="fa fa-paper-plane"></i>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.box-footer-->
	</div>
</div>