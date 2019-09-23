<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="includes/header.jsp"%>
<!--공간띄우는것 필요함. 임시로 br태그사용-->
<div class="container center-block mt-4">
	<div class="card border-primary">
		<div class="row">
			<div class="col-lg-12">
				<h3
					class="page-header text-primary font-weight-bold card-title mt-2 ml-2">취뽀게시판</h3>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading text-right">
						<button id='regBtn' type="button"
							class="btn btn-primary pull-right mr-3">글작성</button>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="container">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>수정일</th>
										<th>조회</th>
									</tr>
								</thead>


								<c:forEach items="${list }" var="board">
									<tr>
										<td><c:out value="${board.board_id }" /></td>
										<td><a class='move'
											href='<c:out value="${board.board_id }"/>'>
												<c:out value="${board.board_title }" />
												<b>[<c:out value="${board.replyCnt}" />]</b></a></td>
										<td><c:out value="${board.board_writer }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.board_regdate }" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${board.board_updateDate}" /></td>
										<td><c:out value="${board.board_hit }" /></td>
									</tr>
								</c:forEach>
							</table>
							<div class = 'row'>
							<div class="col-lg-12">
							
							<form id = 'searchForm' action="list" method='get'>
							<select name='type'>
							<option value=""
							<c:out value="${pageMaker.cri.type == null? 'selected' : ''}"/>>--</option>
							<option value="t"
							<c:out value="${pageMaker.cri.type eq 't'? 'selected' : ''}"/>>제목</option>
							<option value="c"
							<c:out value="${pageMaker.cri.type eq 'c'? 'selected' : ''}"/>>내용</option>
							<option value="w"
							<c:out value="${pageMaker.cri.type eq 'w'? 'selected' : ''}"/>>작성자</option>
							<option value="tc"
							<c:out value="${pageMaker.cri.type eq 'tc'? 'selected' : ''}"/>>제목 or 내용</option>
							<option value="tw"
							<c:out value="${pageMaker.cri.type eq 'tw'? 'selected' : ''}"/>>제목 or 작성자</option>
							<option value="twc"
							<c:out value="${pageMaker.cri.type eq 'twc'? 'selected' : ''}"/>>제목 or 작성자 or 내용</option>
							</select>
							
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
							<button class='btn btn-primary'>Search</button>
							</form>
							</div>
							</div>

					

								<nav aria-label="Board Page navigation">
									<ul class="pagination justify-content-end">
										<c:if test="${pageMaker.prev}">
												<li class="page-item previous"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
											</c:if> <c:forEach var="num" begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }">
												<li class="page-item ${pageMaker.cri.pageNum == num? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
											</c:forEach> <c:if test="${pageMaker.next }">
												<li class="page-item next"><a class="page-link" href="${pageMaker.endPage +1}">Next</a></li>
											</c:if>
								
									</ul>
								</nav>
							</div>
				

						<!-- Modal-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="myModalLabel">확 인 창</h5>
										<button class="close" type="button" data-dismiss="modal"
											aria-label="true">&times;</button>
									</div>
									<div class="modal-body">처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">확 인</button>
									</div>
								</div>
								<%--/.modal-content--%>
							</div>
							<%--./modal-dialog--%>
						</div>
						<%--modal--%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id='actionForm' action="list" method='get'>
<input type = 'hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
<input type = 'hidden' name='amount' value='${pageMaker.cri.amount}'> 
<input type = 'hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />'>
<input type = 'hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />'>
</form>

<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
				$("#regBtn").on("click", function() {
					self.location = "register";
				});
				
				var actionForm = $("#actionForm");
				$(".page-item a").on("click", function(e){
					e.preventDefault();
					console.log('click');
					
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				$(".move").on("click",function(e){
					e.preventDefault();
					actionForm.append("<input type='hidden' name='board_id' value='"+$(this).attr("href")+"'>");
					actionForm.attr("action","get");
					actionForm.submit()
					
				});

				var searchForm = $("#searchForm");
				$("#searchForm button").on("click", function(e) {
					if(!searchForm.find("option:selected").val()) {
						alert("검색종류를 선택하세요");
						return false;
					}
					if(!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}
					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();
					
					searchForm.submit();
				}); 
				
			});
</script>


<%@ include file="includes/footer.jsp"%>