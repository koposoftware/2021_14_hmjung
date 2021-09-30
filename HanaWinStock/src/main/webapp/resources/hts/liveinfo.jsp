<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box">
	<div class="box-header with-border">
		<h4 class="box-title">Wallet Balance</h4>
	</div>
	<div class="box-body">
		<div class="d-flex justify-content-between pb-10">
			<h4>현재가:</h4>
			<h3>
				$ <span class="attr marketPrice">0.0</span>
			</h3>			
		</div>		
		<div class="dropdown">
					<button class="dropbtn btn-primary mt-10">상세 정보</button>
					<div class="dropdown-content">
						<div class="d-flex justify-content-between bb-1 pb-5">
							<h5 class="text-fade fullname"></h5>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>주가 변동률:</h6>
							<h6>
								<span class="attr marketChangePercent"></span>%
							</h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>거래량:</h6>
							<h6 class="attr marketVolume"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>매도량:</h6>
							<h6 class="attr bidSize"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>매수량:</h6>
							<h6 class="attr askSize"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>배당률:</h6>
							<h6 class="attr dividendsYield"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>유동주식 수:</h6>
							<h6 class="attr floatingShares"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>공매도 주식수:</h6>
							<h6 class="attr shortRatio"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>발행 주식수:</h6>
							<h6 class="attr shareOutstanding"></h6>
						</div>
						<div class="d-flex justify-content-between pb-10">
							<h6>주당 순이익 (EPS):</h6>
							<h6 class="attr epsForward"></h6>
						</div>
					</div>
				</div>	
		
		
				
		<div class="row">
			<label class="col-form-label text-nowrap pr-10 mt-10">개수</label>
			<div class="col-md-8">
				<input class="form-control actionCount" type="number" maxlength="25" placeholder="개수 입력" style="background-color: #f5f5f5;">
				<button type="button" class="waves-effect waves-light btn btn-primary btn-lg mt-10 btn-sell">
					매도 <span class="attr bid"></span>$
				</button>
				<button type="button" class="waves-effect waves-light btn btn-danger btn-lg mt-10 btn-buy">
					매수 <span class="attr ask"></span>$
				</button>
			</div>	
				

		</div>


		
	</div>
</div>
