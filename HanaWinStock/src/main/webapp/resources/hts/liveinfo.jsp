<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="box">
	<div class="box-body">
		<div>
		<h6 style="display:inline;"> 현재가: &nbsp;&nbsp; </h6>		
		<h3 style="display:inline;">$ 
		<span class="attr marketPrice">0.0</span></h3>
		</div>
		<div class="my-15">
		<h6 style="display:inline;"> 거래량: &nbsp;&nbsp; </h6>		
		<h3 style="display:inline;">
		<span class="attr marketVolume">0</span></h3>
		</div>





		<div class="row">
			<label class="col-form-label text-nowrap pr-10 mt-10">개수</label>
			<div class="col-md-12">
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
