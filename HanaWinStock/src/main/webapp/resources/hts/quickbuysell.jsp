<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
					<div class="box-body">
						<!-- Nav tabs -->
						<ul class="nav nav-pills">
							<li class="nav-item"><a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="false">빠른 주문</a></li>
							<li class="nav-item"><a href="#navpills-2" class="nav-link" data-bs-toggle="tab" aria-expanded="false">지정가 주문</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content bg-lightest p-20 mt-20">
							<div id="navpills-1" class="tab-pane active">
								<div class="row">
									<div class="col-xl-6 col-12">
										<div class="d-flex justify-content-between">
											<h4>빠른 매수</h4>
										</div>										
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">개수</label>
												<div class="col-md-8">
													<input class="form-control buyCount" type="number" maxlength="25"> <span class="currency">ETH</span>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">가격</label>
												<div class="col-md-8">
													<input class="form-control buyPrice"  type="number"  maxlength="25"> <span class="currency">PLN</span>
												</div>
											</div>
											<button type="button" class="btn btn-success btn-block btn-buy">매수</button>										
									</div>
									<div class="col-xl-6 col-12">
										<div class="d-flex justify-content-between">
											<h4>빠른 매도</h4>
										</div>
										<form class="dash-form">
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">개수</label>
												<div class="col-md-8">
													<input class="form-control sellCount" type="number"  maxlength="25"> <span class="currency">ETH</span>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">가격</label>
												<div class="col-md-8">
													<input class="form-control sellPrice" type="number"  maxlength="25"> <span class="currency">PLN</span>
												</div>
											</div>
											<button type="button" class="btn btn-danger btn-block btn-sell">매도</button>
										</form>
									</div>
								</div>
							</div>
							<div id="navpills-2" class="tab-pane">
								<div class="row">
									<div class="col-xl-6 col-12">
										<div class="d-flex justify-content-between">
											<h4>Quick Buy</h4>
										</div>

										<form class="dash-form">
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">I want to buy</label>
												<div class="col-md-8">
													<input class="form-control" type="text" value="1.00000000" maxlength="25"> <span class="currency">ETH</span>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">I will pay:</label>
												<div class="col-md-8">
													<input class="form-control" type="text" value="0.03240000" maxlength="25"> <span class="currency">PLN</span>
												</div>
											</div>
											<button type="submit" class="btn btn-success btn-block">Buy</button>
										</form>
									</div>
									<div class="col-xl-6 col-12">
										<div class="d-flex justify-content-between">
											<h4>QuickSell</h4>
										</div>
										<form class="dash-form">
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">I want to sell</label>
												<div class="col-md-8">
													<input class="form-control" type="text" value="1.00000000" maxlength="25"> <span class="currency">ETH</span>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 col-form-label text-nowrap pr-10">I want receive:</label>
												<div class="col-md-8">
													<input class="form-control" type="text" value="0.03240000" maxlength="25"> <span class="currency">PLN</span>
												</div>
											</div>
											<button type="submit" class="btn btn-danger btn-block">Sell</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
		