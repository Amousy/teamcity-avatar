<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="ext" tagdir="/WEB-INF/tags/ext" %>

<jsp:useBean id="suppliers" scope="request"
             type="java.util.Map<java.lang.String, ru.mail.teamcity.avatar.supplier.IndividualAvatarSupplier>"/>
<jsp:useBean id="suppliersBean" scope="request" type="ru.mail.teamcity.avatar.config.Suppliers"/>
<jsp:useBean id="actionErrors" type="jetbrains.buildServer.controllers.ActionErrors" scope="request"/>

<c:if test="${actionErrors.hasErrors()}">
  <ul id="errors" class="validation">
    <c:forEach var="error" items="${actionErrors.errors}">
      <li>${error.message}</li>
    </c:forEach>
  </ul>
</c:if>

<form id="adminAvatarSettings" name="adminAvatarSettings" action="">
  <fieldset class="group">
    <legend>Select automatic avatar suppliers:</legend>

    <ul id="suppliers-container">
      <c:forEach var="supplierBean" items="${suppliersBean.supplierList}">
        <li id="${supplierBean.id}">
          <c:set var="supplier" value="${suppliers.get(supplierBean.id)}"/>
          <input type="checkbox" id="${supplierBean.id}_checkbox" name="${supplierBean.id}"
                 <c:if test="${supplierBean.enabled}">checked="checked"</c:if>/>
          <label for="${supplierBean.id}_checkbox">${supplier.optionName}</label>
        </li>
      </c:forEach>
    </ul>
  </fieldset>

  <input type="button" value="Save" class="btn" onclick="saveSuppliers('${pageContext.request.contextPath}')"/>
</form>

<ul id="errors" class="hidden validation"></ul>
<div id="success" class="hidden success"></div>
