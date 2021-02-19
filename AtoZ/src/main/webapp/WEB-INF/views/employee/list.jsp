<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content">
<div class="container-xl">
<div class="card">
          <div class="card-header">
            <h3 class="card-title">직원 리스트</h3>
          </div>

          <div class="card-body">
            <!-- form -->
            <div class="table-responsive">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                  <tr>
                    <th class="text-center">직원ID</th>
                    <th class="text-center">직원명</th>
                    <th class="text-center">담당업무</th>
                    <th class="text-center">입사일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">ddl01083</td>
                    <td class="text-center">임정혁</td>
                    <td class="text-center">출고</td>
                    <td class="text-center">2020/02/21</td>
                  </tr>
                  <tr>
                    <td class="text-center">abc123</td>
                    <td class="text-center">홍길동</td>
                    <td class="text-center">피킹</td>
                    <td class="text-center">2020/04/25</td>
                  </tr>
                </tbody>
              </table>
              <a href="<%=request.getContextPath() %>/employee/registForm" class="btn btn-light" style="margin-top:5px;" >
                      	직원등록
                    </a>
            </div>
            <!-- /form -->
          </div>
        </div>
        </div>
        </div>