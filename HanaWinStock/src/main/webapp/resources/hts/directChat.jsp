	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<input type="hidden" id="sessionId" value="">
					<div class="box direct-chat direct-chat-info full-chat-box">
						<div class="box-header with-border">
						  <h4 class="box-title">Direct Chat</h4>
							<ul class="box-controls pull-right">
							  <li><a class="box-btn-close" href="#"></a></li>
							  <li><a class="box-btn-slide" href="#"></a></li>
							  <li><a class="box-btn-fullscreen" href="#"></a></li>
							  <li><a class="" data-bs-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle"><i class="ti-comments"></i></a></li>
							  <li><span data-bs-toggle="tooltip" title="1 New Messages" class="badge badge-pill badge-info">5</span></li>
							</ul>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
						  <!-- Conversations are loaded here -->
						  <div class="direct-chat-messages" id="direct-chat">
							<!-- Message. Default to the left -->
					
						  <!--/.direct-chat-messages-->

						  <!-- /.direct-chat-pane -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
						 
							<div class="input-group">
							  <input type="text" name="message" id="chat" placeholder="Type Message ..." class="form-control">
								  <div class="input-group-addon">
									<div class="align-self-end gap-items">
									  <span class="publisher-btn file-group">
										<i class="fa fa-paperclip file-browser"></i>
										<input type="file">
									  </span>
									<a class="publisher-btn" href="#"><i class="fa fa-smile-o"></i></a>
									 <a id="send-msg"  class="publisher-btn"><i class="fa fa-paper-plane"></i></a>																		 
									</div>
								  </div>
							</div>
					
						</div>
						<!-- /.box-footer-->
					  </div>
				</div>