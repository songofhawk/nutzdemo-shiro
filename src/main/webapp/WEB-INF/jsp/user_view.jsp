<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<jsp:include page="header.jsp" />

    <ul class="breadcrumb">
      <li>
        <a href="user/all">用户管理</a> <span class="divider">/</span>
      </li>
      <li class="active">编辑用户</li>
    </ul>
    <div class="row">
      <div class="span6">
    <form action="user/edit" class="form-horizontal">
    <fieldset>
      <legend>编辑用户信息</legend>
      <input type="hidden" name="id" value="${obj.id}"/>
      <div class="control-group">
        <label class="control-label" for="name">姓名</label>
        <div class="controls">
          <input type="text" name="name" id="name" value="${obj.name}" class="input-big"/>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="sex">性别</label>
        <div class="controls">
          <input type="text" name="sex" id="sex" value="${obj.sex}" class="input-big"/>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="description">说明</label>
        <div class="controls">
          <textarea name="description" id="description" rows="3" class="input-big">${obj.description}</textarea>
        </div>
      </div>
      <div class="form-actions">
        <input type="submit" value="${msg.edit}" class="btn btn-primary"/>
        <a href="user/all" class="btn">取消</a>
      </div>
    </fieldset>
    </form>
      </div>
      <div class="span6">
    <form action="user/addRole" class="well form-vertical">
    <fieldset>
      <legend>给用户 ${obj.name} 分配新角色</legend>
      <input type="hidden" name="userId" value="${obj.id}"/>
      <div class="control-group">
        <label class="control-label" for="roleId">角色</label>
        <div class="controls">
          <select name="roleId" id="roleId">
            <option value="0" selected>请选择欲分配的角色</option>
          </select>
        </div>
      </div>
      <div class="">
        <input type="submit" value="分配" class="btn btn-primary"/>
      </div>
    </fieldset>
    </form>
      </div>
    </div>
    
    
    <hr/>
    <h2>${obj.name}拥有的角色:</h2>
    <table class="table table-striped">  
    <thead>
    <tr>
        <th>名称</th>
        <th>备注</th>
        <th>移除</th>
      </tr>
    </thead>
    <c:forEach var="role" items="${obj.roles}">
      <tr>
        <td>${role.name}</td>
        <td>${role.description}</td>
        <td><a href="user/removeRole?userId=${obj.id}&roleId=${role.id}"><i class="icon-remove"></i>&nbsp;移除</a></td>
      </tr>
    </c:forEach>
    </table>

<jsp:include page="footer.jsp" />

  <script type="text/javascript">
  $.getJSON('role/map',function(response){
    $.each(response,function(value,text){
      var newopt='<option value="'+value+'">'+text+'</option>';
        $("#roleId").append(newopt);
    });
  });
  </script>