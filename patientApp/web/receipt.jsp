<%-- 
    Document   : receipt
    Created on : May 28, 2014, 4:46:43 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/template.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript">

            $(document).ready(function() {
                $('#printBtn').click(function() {
                    window.print();
                });
            });

        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="no-print">               

            <span class="menuItems">
                <table border="1" cellpadding="15" cellspacing="0">
                    <tr>


                        <td>
                            <ul class="btnMenuTab">
                                <li class="btnMenu"><a href="<%=request.getContextPath()%>/Index">Patient Search</a></li>
                                <li class="btnMenu" ><a href="<%=request.getContextPath()%>/PatientRecord">Patient Record</a></li>
                                <li class="btnMenu"><a href="<%=request.getContextPath()%>/PatientRegistration">Patient Registration</a></li>
                                <li class="btnMenu"><a href="<%=request.getContextPath()%>/ApplicationMaintainence">Application Maintainence</a></li>
                                <li class="btnMenu"><a href="<%=request.getContextPath()%>/HomePage">Log Out</a></li>

                            </ul>

                        </td>
                    </tr>
                </table> 
            </span>
        </div>

        <span class="bodyContent">
            <div class="no-print">               

                <ul class="btnMenuTab">
                    <li class="btnMenu"><a href="#" id = "printBtn" >Print Receipt</a></li>
                </ul>
            </div>
            <table class="receiptTable">
                <tr class="receiptTable">
                    <td colspan ="2" width = "700px" align="center">
                        Chinese Medicine & Acupuncture Society of Australia<br/>
                        PO Box 1323 Burwood NSW 1805 Tel: XXXXXXXX Fax: YYYYYYYY <br/>
                        Email: info@australiatcm.com.au  www.australiantcm.com.au

                    </td>
                </tr>

                <tr class = "receiptTable">
                    <td>
                        INVOICE / RECEIPT <br/>
                        Mr / Mrs / Ms.  NG ZHI XIAN

                    </td>
                    <td>
                        Date: <br/>
                        PHI: <br/>
                        Provider: <br/>

                    </td>

                </tr>
                <tr>

                    <td width="300px"><table class="receiptTable" width="300px" height="192px">
                            <tr><td></td></tr>
                        </table>
                    </td>
                    <td>
                        <table class="receiptTable" width = "500" >
                            <tr class = "receiptTable">
                                <td colspan="2" class = "receiptTable">Descriptions</td>
                                <td colspan="2" class = "receiptTable">Item #</td>
                                <td class = "receiptTable">Amount</td>

                            </tr>
                            <tr id = "receiptTable">
                                <td class = "receiptTable" rowspan="4">Initial/ Standard</td>
                                <td class = "receiptTable">Consultation</td>
                                <td class = "receiptTable">303</td>
                                <td class = "receiptTable">403</td>
                                <td class = "receiptTable">Amount1</td>
                            </tr>
                            <tr class = "receiptTable">
                                <td class = "receiptTable">Acupuncture treatment</td>
                                <td class = "receiptTable">103</td>
                                <td class = "receiptTable">203</td>
                                <td class = "receiptTable">Amount 2</td>
                            </tr>
                            <tr class = "receiptTable">
                                <td class = "receiptTable">Remedial Massage</td>
                                <td class = "receiptTable">105</td>
                                <td class = "receiptTable">205</td>
                                <td class = "receiptTable">Amount 3</td></tr>
                            <tr class = "receiptTable">
                                <td>Days of Herbal Medicine</td>
                                <td class = "receiptTable" colspan="2">503</td>
                                <td class = "receiptTable">Amount 4</td>
                            </tr >

                            <tr class = "receiptTable">
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td colspan="2" aligh="center">Total</td>
                                <td class = "receiptTable">Amount5</td>
                            </tr>
                            <tr class = "receiptTable">
                                <td class = "receiptTable">Rebate</td>
                                <td class = "receiptTable">Rebate Amount</td>
                                <td class = "receiptTable" colspan="2">Paid</td>
                                <td class = "receiptTable">Amount 6</td>


                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </span>

    </body>
</html>
