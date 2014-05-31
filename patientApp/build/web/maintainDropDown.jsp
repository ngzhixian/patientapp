<%-- 
    Document   : maintainDropDown
    Created on : May 20, 2014, 12:26:54 AM
    Author     : Sean
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.MasterDO" %>
<%@ page import="com.Database" %>
<%@ page import="java.util.*" %>
<%@include file="/validationLogin.jsp"%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Application</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <link href="css/chosen.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>

        <script type="text/javascript">
            function dropDownPageLoad(a) {
                var session = a;
                var e1 = document.getElementById('selectDdForEdit');
                for (var i = 0; i < e1.options.length; i++) {
                    var b = e1.options[i].value;
                    if (session == b) {
                        e1.options[i].selected = true;
                    }
                }

            }

            function onChangeSubmit() {
                document.editDdValuesForm.action = "MaintainDropDown";
                document.editDdValuesForm.method = "Post";
                document.editDdValuesForm.submit();

            }

            function removeItems() {
                document.editDdValuesForm.action = "MaintainDropDown";
                document.editDdValuesForm.method = "Post";
                document.editDdValuesForm.actionTy.value = "remove";
                document.editDdValuesForm.submit();
            }

            function addItems() {
                document.editDdValuesForm.action = "MaintainDropDown";
                document.editDdValuesForm.method = "Post";
                document.editDdValuesForm.actionTy.value = "add";
                document.editDdValuesForm.submit();

            }

            $(document).ready(function() {
                $('input, select').keypress(function() {
                    return event.keyCode != 13;
                });

            });
        </script>
    </head>

    <body onload="return this.dropDownPageLoad('<%=session.getAttribute("KeyTy")%>');">

        <span class="menuItems" id="menuItems">
            <table border="1" cellpadding="15" cellspacing="0">
                <tr>
                    <td>
                        <ul class="btnMenuTab">
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/Index">Patient Search</a></li>
                            <li class="btnMenu" ><a href="<%=request.getContextPath()%>/PatientRecord">Patient Record</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/PatientRegistration">Patient Registration</a></li>
                            <li class="btnMenu" ><a class="active" href="<%=request.getContextPath()%>/ApplicationMaintainence">Application Maintainence</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/HomePage">Log Out</a></li>

                        </ul>

                    </td>

                </tr>
            </table> 
        </span>
        <span class="bodyContent" id="bodyContent">

            <form name="editDdValuesForm" charset=utf-8>
                <select class="chosen-select" name="selectDdForEdit" id="selectDdForEdit" onchange="return onChangeSubmit()">
                    <option value = "">Please Select</option>
                    <option value = "CHIEF_COMPLAINTS">Chief Complaints</option>
                    <option value = "PRESENT_SYMPTOMS">Present Symptoms</option>
                    <option value = "OTHER_SYMPTOMS">Other Symptoms</option>
                    <option value = "TCM_DD">TCM Disease Diagnosis</option>
                    <option value = "TCM_SD">TCM Syndrone differentiation</option>
                    <option value = "WEST_MED">Western Medicine Diagnosis</option>

                    <option value = "AET_PATH">Aetiology & Pathogenesis</option>
                    <option value = "REMEDIAL_MASSAGE">Remedial Massage</option>

                    <option value = "ACUPUNCTURE">Acupuncture</option>
                    <option value = "HERBS">Herbs</option>
                    <option value = "REMEDIAL_MASSAGE">Remedial Massage</option>
                    <option value = "MEDICAL_FUND">Medical Fund</option>
                    <option value = "PRINCIPLE_OF_TREATMENT">Principle Of Treatment</option>
                    <option value = "OUTCOME">Outcome</option>
                    <option value = "ADVICE">Advice</option>
                    <option value = "TREATMENT_PLAN">Treatment Plan</option>

                </select><br/>

                <select name="existingList" id ="existingList" size="10" style="width:200px">
                    <%  if (session.getAttribute("MasterSingleDrop") != null) {
                            ArrayList masterSingleDrop = (ArrayList) session.getAttribute("MasterSingleDrop");
                            for (int i = 0; i < masterSingleDrop.size(); i++) {
                                MasterDO master = (MasterDO) masterSingleDrop.get(i);

                    %>
                    <option value = "<%=master.getCd()%>"><%=master.getDescription()%></option>

                    <%}
                        }%>
                </select>

                <br/>

                Add New Item:

                <input type="text" name="newItem" value="" style="width:200px"/>
                <input type="hidden" name="actionTy" id="actionTy" />
                <br/>
                <br/>
                <div align="center">
                <input class="btnMenu" type="button" value="Add" name="add" onclick="return addItems();" /><br/>
                <input class="btnMenu" type="button" value="Remove" name="remove" onclick="return removeItems();" />
                </div>
            </form>   

        </span>
    </body>
</html>
