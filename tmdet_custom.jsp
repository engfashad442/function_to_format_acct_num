<%@ page import="applcommon.ParseValue" %>
<%@ page import="com.infy.bbu.jsputil.*"%>
<%@ taglib uri="taglib.tld" prefix="arjsp" %>

<%@ page language="java" import="java.util.*,"%>
<%@ page language="java" import="java.lang.*,"%>
<!--jsp:useBean id="customBeanInst" class="com.infy.finbranch.groups.customBean" scope="session" /-->

<%-- This is the COMMON include for any custom tab/menu --%>
<%@ include file='../commonInclude.jsp'%>

<html>
<head>
<SCRIPT language="javascript" src="../custom/javascripts/custom_functions.js" ></SCRIPT>
<SCRIPT language="javascript" src="../custom/javascripts/cust_common_functions.js" ></SCRIPT>
<SCRIPT language="javascript" src="../custom/javascripts/cust_fetch_list.js" ></SCRIPT>
<SCRIPT language="javascript" src="../javascripts/cust_post_evt.js" ></SCRIPT>
<SCRIPT language="javascript" src="../javascripts/cust_pre_evt.js" ></SCRIPT>


<script type="text/javascript">

  

	
   function setVals( str) {
	//alert(str);
	sel = document.forms[0].particulars;
	for (i=0; i<sel.options.length; i++) {
//		alert(sel.options[i].text);
		
		if (sel.options[i].text == str) {
	//	alert('index now '+i);
		//alert(str)
		createCookie("particulars",str,0);
			sel.selectedIndex = i;
		}
	}
   }

    function AddItem(Text,Value)
    {
        // Create an Option object        
	
	 sel = document.forms[0].particulars;
        for (i=0; i<sel.options.length; i++) {
                //alert(sel.options[i].text);

                if (sel.options[i].text == Text) {
        //        alert('exist');
		return true;
                }
        }


        var opt = document.createElement("option");

        // Add an Option object to Drop Down/List Box
        document.getElementById("particulars").options.add(opt);

        // Assign text and value to Option object
        opt.text = Text;
        opt.value = Value;

    }

function fnAccountList(obj)
{
        showAccountIdList(document.forms[0].acctNum);
        obj.onchange();
}


function _checkSpecialChars()
{
        var obj=document.forms[0];
        var len=obj.length;

        for(i=0;i<len;i++)
        {
                if(obj(i).type == "text")
                {
                                var txtStr = obj(i).value;
                                obj(i).value = txtStr.toUpperCase();
                                if(txtStr.indexOf("&", 0) >= 0)
                                {

                                        obj(i).focus()
                                        obj(i).select()
					obj(i).value = ""
                                        alert("The Field Should not contain & character")
                                        return false;
                                }
                                if(txtStr.indexOf("%", 0) >= 0)
                                {
                                        obj(i).focus()
                                        obj(i).select()
					obj(i).value = ""
                                        alert("The Field Should not contain % character")
                                        return false;
                                }
                                if(txtStr.indexOf("~", 0) >= 0)
                                {
                                        obj(i).focus()
                                        obj(i).select()
					obj(i).value = ""
                                        alert("The Field Should not contain ~ character")
                                        return false;
                                }
                                if(txtStr.indexOf("^", 0) >= 0)
                                {
                                        obj(i).focus()
                                        obj(i).select()
					obj(i).value = ""
                                        alert("The Field Should not contain ^ character")
                                        return false;
                                }
                                if(txtStr.indexOf("'", 0) >= 0)
                                {
                                        obj(i).focus()
                                        obj(i).select()
					obj(i).value = ""
                                        alert("The Field Should not contain \' character")
                                        return false;
                                }
                }
        }
        return true;
}


function dohxfernarration()
{
            var frm =document.forms[0];
	        var tranParticularsCode = frm.tranParticularsCode.value;
	        var type = frm.tranType.value;
            var stype = frm.tranSubType.value;
			var instrType  = frm.instrType.value;
			var instrNum  = frm.instrNum.value;
			var depositor = frm.tranRmks.value;
			var refNum = frm.refNum.value;
			var pTranType = getRadioValue(document.forms[0].pTranType);
			
		    var withrawer = "";
			var schmTypeValue = "";
			var acctOwnerShipValue = "";
		   
			
	    if(mopId.toUpperCase() == "HXFER" )
         {	
	       if(document.forms[0].tranParticularsCode.value == "")
	       {
	          alert("TranParticularsCode field cannot be empty");
		      frm.tranParticularsCode.focus();
		       return false;
	       }
		   else
		   {
		       if(frm.acctId.value != "") {
			    
				if(frm.tranParticularsCode.value != "")
				{
				
				   if(tranParticularsCode == "OTH")
			       {
			               document.getElementById("tranParticular").readOnly = false;
                           //document.getElementById("tranParticularsCode").readOnly = true;	   
			       } 
				   else 
			       {
				   
				     if(frm.refNum.value == "")
			         {
			            alert("Refno field can not be empty");
				          frm.refNum.focus();
				          return false;
		             }
				
				     if(frm.tranRmks.value == "")
			         {
			           alert("Depositor field can not be empty");
				         frm.tranRmks.focus();
				         return false;
		             }
				    tranParticularsCode = frm.tranParticularsCode.value;
					//alert(tranParticularsCode);
				    acctId = frm.acctId.value;
				    refNum = frm.refNum.value;
				    depositor = frm.tranRmks.value;
				    refAmt = frm.refAmt.value;
				    var inputNameValues ="tranParticularsCode|"+tranParticularsCode+"|acctId|"+acctId+"|pTranType|"+pTranType+"|refNum|"+refNum+"|depositor|"+ depositor +"|refAmt|"+ refAmt;
				    outputNames = "HxferNarration";
	                scrName     = "hxfernarration.scr"
                    retval = appFnExecuteScript(inputNameValues,outputNames,scrName,true);
                    var hxfernarration = document.forms[0].HxferNarration.value;
					document.forms[0].tranParticular.value = hxfernarration;
		          
			   
			       }
				  
				  
				}
				
				
				
				 
						   
			}
          	
		   
		   }
	    }
}

function custom_ONBLUR(obj,p1,p2,p3,p4)
{
	
        var frm = document.forms[0];
	    var refAmt = frm.refAmt.value;
		var refNum = frm.refNum.value;
		var pTranType = getRadioValue(document.forms[0].pTranType);
        
        var type = frm.tranType.value;
        var stype = frm.tranSubType.value;
		var instrNum = frm.instrType.value;		  
		  var depositor = frm.tranRmks.value;
		  depositor = frm.tranRmks.value.substring(0,27);
		  var tranParticularsCode = frm.tranParticularsCode.value;
	if(mopId.toUpperCase() == "HCASHDEP" || mopId.toUpperCase() == "HCASHWD" || mopId.toUpperCase() == "HTM" || mopId.toUpperCase() == "HXFER" )
    {
	   if((frm.acctId.value != "") || (frm.acctId.value =="null"))  {
			 var acctId = frm.acctId.value;
	         var inputNameValues ="foracid|"+acctId;
 
		     var scrName = "MomemtAccountSchmDescriptionAlert.scr";
             var outputNames ="MomentAlertFlg|MomentDesc";
             retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	         var MomentAlertFlg = document.forms[0].MomentAlertFlg.value;
		     var MomentDesc = document.forms[0].MomentDesc.value;
		    if( MomentAlertFlg == "Y") 
			{
			   alert("The scheme for this  " + MomentDesc);
			
			}
			  
	   }
	
	}
	if(mopId.toUpperCase() == "HCASHDEP" || mopId.toUpperCase() == "HCASHWD" )
    {
	    if(frm.acctId.value != "")  {
	       /* inputNameValues = "acctId|" + frm.acctId.value;
		    outputNames = "withrawernameValue|schmTypeValue|acctOwnerShipValue";
	        scrName  = "withrawername.scr"
            retval = appFnExecuteScript(inputNameValues,outputNames,scrName,true);
            var withrawer = document.forms[0].withrawernameValue.value;
		    var schmTypeValue = document.forms[0].schmTypeValue.value;
		    var acctOwnerShipValue = document.forms[0].acctOwnerShipValue.value; */
			    if(frm.tranRmks.value != "")
			    { 		          
			      //if ((frm.refNum.value != "" ) && (frm.tranRmks.value != ""))  {
				     
		  if( stype == "NP" ) {
              if(frm.instrType.value == "CHQ")  {
	               if(frm.acctId.value == "")  {
	                 alert("Account Number field can not be empty")
		              frm.acctId.focus();
					   return false;
                   } else {                   
	                  		 
		      if(instrNum == "")  {
			     alert("Instrument number field can not be empty");
			     frm.instrNum.focus();
				  return false;
		       } else {
			        depositor = depositor.substring(0,27);
			       frm.tranParticular.value = "-Cheque Paid to " + depositor; 
				   var lentranParticular = frm.tranParticular.value.length;
				 
				 if (lentranParticular > 50)
				 { 
				   frm.tranParticular.value = frm.tranParticular.value.substring(0,50);
				 }
		       }
		   
		   
		 
		 }
    
      }else {			 
			  depositor = depositor.substring(0,27);
			  frm.tranParticular.value = "-Cash Withdrawal by " + depositor;
			  var lentranParticular = frm.tranParticular.value.length;
				 
				 if (lentranParticular > 50)
				 { 
				   frm.tranParticular.value = frm.tranParticular.value.substring(0,50);
				 }
		     
 
        }
	
     }
		  
		  
	
	     if(stype == "NR") {
			  	depositor = depositor.substring(0,27);
			  frm.tranParticular.value = "-Cash Deposit by " + depositor;
			  var lentranParticular = frm.tranParticular.value.length;
				 
				 if (lentranParticular > 50)
				 { 
				   frm.tranParticular.value = frm.tranParticular.value.substring(0,50);
				 }
		     
			    
		  }
		  
		  if(pTranType == "C" && stype == "CT")
		  {
			  var slipnum = frm.refNum.value;
			  var depositor = frm.tranRmks.value;
			  
			   frm.tranParticular.value ="-Cash Deposit by " + depositor;
			   var lentranParticular = frm.tranParticular.value.length;
				 
				 if (lentranParticular > 50)
				 { 
				   frm.tranParticular.value = frm.tranParticular.value.substring(0,50);
				 }
		  }
		
		  if(pTranType == "D" && stype == "CT")
		  {
		     frm.tranParticular.value = "-Cash Withdrawal by " + depositor;
			  var lentranParticular = frm.tranParticular.value.length;
				 
				 if (lentranParticular > 50)
				 { 
				   frm.tranParticular.value = frm.tranParticular.value.substring(0,50);
				 }
		  }
	
				  //}
				  

			    } 
		}
			  
	}
		
		
		
}


function fnChange()
{
	 objForm = document.forms[0];		
	 


        var acct = (objForm.acctNum.value).toUpperCase();
//	alert(acct);
        var inputNameValues = "acctNum|"+acct;
        //var outputNames = "surname|address|phoneNumber|particulars|idNumber|issueDate|expiryDate|code";
        var scrName     = "popNfiuCustData.scr"
    var outputNames = "surname|firstname|middlename|address|phoneNumber|ptype|idNumber|issueDate|expiryDate|ptypedesc|code";

        retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);

       if(document.forms[0].code.value == "O") 
        {
                alert("Office accounts not allowed here");
                objForm.acctNum.focus();
                objForm.acctNum.value="";
                objForm.surname.value="";
		 objForm.firstname.value="";
		objForm.middlename.value="";
                objForm.address.value="";
                objForm.phoneNumber.value="";
                objForm.particulars.value="";
                objForm.idNumber.value="";
                objForm.issueDate.value="";
                objForm.expiryDate.value="";
                objForm.sourceOfFund.value="";
	 eraseCookie("surname");
	eraseCookie("firstname");
	eraseCookie("middlename");
	 eraseCookie("address");
	 eraseCookie("phoneNumber");
 	eraseCookie("particulars");
 	eraseCookie("issueDate");
 	eraseCookie("expiryDate");
 	eraseCookie("idNumber");
 	eraseCookie("source");
  	eraseCookie("tranDate");
 	eraseCookie("acctNum");
                return false
        }
   	objForm.issueDate_ui.value = objForm.issueDate.value;
	objForm.expiryDate_ui.value = objForm.expiryDate.value;

	_checkSpecialChars();

	AddItem(objForm.ptypedesc.value,objForm.ptype.value);
        setVals(objForm.ptypedesc.value);

//	document.forms[0].particulars.value = objForm.ptype.value;
	createCookie("acctNum",document.forms[0].acctNum.value.toUpperCase(),0);
	createCookie("address",document.forms[0].address.value.toUpperCase(),0);
	createCookie("surname",document.forms[0].surname.value.toUpperCase(),0);
	createCookie("firstname",document.forms[0].firstname.value.toUpperCase(),0);
	createCookie("middlename",document.forms[0].middlename.value.toUpperCase(),0);
	createCookie("phoneNumber",document.forms[0].phoneNumber.value.toUpperCase(),0);
	createCookie("particulars",document.forms[0].particulars.value.toUpperCase(),0);
	createCookie("idNumber",document.forms[0].idNumber.value.toUpperCase(),0);
  	 createCookie("source",document.forms[0].sourceOfFund.value.toUpperCase(),0);
createCookie("tranDate",tranDate, 0);
  	 //createCookie("tranDate",document.forms[0].valueDate.value, 0);
  	 createCookie("issueDate",document.forms[0].issueDate.value,0);
 	  createCookie("expiryDate",document.forms[0].expiryDate.value,0);

        return true;
}


function fnValidateForm(btnId){
 
	 
	validate();	
    	var chck = isFormFilled();
  	 if( chck != "yes")
  	 {
 	  return false;
         }
	 

        frm.IsPageEmpty.value = false;
        setFieldsAsMandatory();
    if(btnId == undefined){
        frm.IsPageEmpty.value = true;
    }
        if ((btnId != 'Validate') && (btnId != 'Go') && serialNo != 1) {
                if (isPageEmpty(frm)) {
                        frm.IsPageEmpty.value = true;
                        return true;
                }
        }
 

        if (!validatePTran()) {
                return false;
        }
        var prec = getPrec(frm.refCrncy.value);
        if (!fnValidateAmount(frm.refAmt.value,prec)) {
                frm.refAmt.focus();
                return false;
        }

        if((btnId == window[multiRecName].addNewAction)) {
                if(chkForAddingNewPartTrans() == false) {
                        return false;
                }
        }

        if((btnId == window[multiRecName].nextAction)) {
                if(serialNo==(iTotalCount-1)) {
                    if(chkForAddingNewPartTrans() == false) {
                         return false;
                    }
                }
        }

	//alert(document.forms[0].srlNum.value);
	//alert(frm.tranType.value);
	

	 if((readCookie("recCounter") != null ) && (document.forms[0].srlNum.value > readCookie("recCounter")) && (readCookie("surname") != null ) && readCookie("recCounter") < 3 )
		{
			//alert("appending");
			 
	   
		document.forms[0]._surname.value =  readCookie("surname")+"#";
		document.forms[0]._firstname.value =  readCookie("firstname")+"#";
		document.forms[0]._middlename.value =  readCookie("middlename")+"#";
 		 document.forms[0]._address.value =   readCookie("address")+"#";
 		document.forms[0]._phoneNumber.value =   readCookie("phoneNumber")+"#";
 		document.forms[0]._particulars.value =  readCookie("particulars")+"#";
 		document.forms[0]._issueDate.value =   readCookie("issueDate")+"#";
		if(readCookie("expiryDate") != null){
 		document.forms[0]._expiryDate.value =   readCookie("expiryDate")+"#";
		}else{
		document.forms[0]._expiryDate.value =   " "+"#";
		}
 		document.forms[0]._idNumber.value =   readCookie("idNumber")+"#";
 		document.forms[0]._source.value =   readCookie("source")+"#";
 		document.forms[0]._tranDate.value =   readCookie("tranDate")+"#";
    
 		//document.forms[0]._issueDate_ui.value = readCookie("_issueDate") + readCookie("issueDate")+"#";
 		//document.forms[0]._expiryDate_ui.value = readCookie("_expiryDate") + readCookie("expiryDate")+"#";
		//alert('3');

		//}
		if((document.forms[0].srlNum.value  == 1) &&   (readCookie("_details2") == null))
		{
		 

		//alert("first page");
		//the end of the temp var has # attached, here its already contenated in d read cookie above
		//alert("first page");
		var temp = document.forms[0]._details1.value + document.forms[0]._surname.value + document.forms[0]._address.value + document.forms[0]._phoneNumber.value + document.forms[0]._particulars.value;
  		  temp  = temp + document.forms[0]._issueDate.value + document.forms[0]._expiryDate.value + document.forms[0]._idNumber.value + document.forms[0]._tranDate.value;
		  temp = temp + document.forms[0]._source.value+pTranType+"#"+tranSubType+"#"+frm.tranType.value+"#"+document.forms[0]._firstname.value + document.forms[0]._middlename.value;
		//alert(temp.toUpperCase());
		document.forms[0]._details1.value = temp.toUpperCase();
	 	createCookie("_details1",temp.toUpperCase(),0);
		createCookie("loop","1",0);
		createCookie("tranType1",frm.tranType.value,0);
		}
		
		if((document.forms[0].srlNum.value  == 2) && (readCookie("_details2") == null))
		{
		//alert("2nd page");
		var temp2 = document.forms[0]._details2.value +document.forms[0]._surname.value + document.forms[0]._address.value + document.forms[0]._phoneNumber.value + document.forms[0]._particulars.value;
  		  temp2  = temp2 + document.forms[0]._issueDate.value + document.forms[0]._expiryDate.value + document.forms[0]._idNumber.value + document.forms[0]._tranDate.value;
		  temp2 = temp2 + document.forms[0]._source.value+pTranType+"#"+tranSubType+"#"+frm.tranType.value+"#"+document.forms[0]._firstname.value + document.forms[0]._middlename.value;
		//alert(temp2.toUpperCase());
		document.forms[0]._details2.value = temp2.toUpperCase();
	 	createCookie("_details2",temp2.toUpperCase(),0);
		createCookie("loop","2",0);
		createCookie("tranType2",frm.tranType.value,0);
		}

		//document.forms[0].acctNum.focus();
                document.forms[0].acctNum.value="";
                document.forms[0].surname.value="";
		document.forms[0].firstname.value="";
		document.forms[0].middlename.value="";
                document.forms[0].address.value="";
                document.forms[0].phoneNumber.value="";
                document.forms[0].particulars.value="";
                document.forms[0].idNumber.value="";
                document.forms[0].issueDate.value="";
                document.forms[0].expiryDate.value="";
                document.forms[0].sourceOfFund.value="";

   		 
		 eraseCookie("surname");
		 eraseCookie("firstname");
		 eraseCookie("middlename");
  		eraseCookie("address");
 		eraseCookie("phoneNumber");
 		eraseCookie("particulars");
 		eraseCookie("issueDate");
 		eraseCookie("expiryDate");
 		eraseCookie("idNumber");
 		eraseCookie("source");
  		eraseCookie("tranDate");
  		eraseCookie("acctNum");

var tempRecCounter =  parseInt(readCookie("recCounter"),10) + 1;
eraseCookie("recCounter");
createCookie("recCounter",tempRecCounter,0);
//alert(tempRecCounter +"   "+ document.forms[0].srlNum.value);

 		
		// alert(document.forms[0]._surname.value);
	  }
      /**
        Navigation between records now happen through New MRH.
        Before submitting the request for "next", "prev" action, this validation gets called.
        Signature Verification should happen here only if this gets called throgh MRH.
        **/
        if ((btnId == window[multiRecName].multiRecAction) ||
                (btnId == window[multiRecName].nextAction) ||
                (btnId == window[multiRecName].prevAction) ||
                (btnId == window[multiRecName].prevPageAction) ||
                (btnId == window[multiRecName].nextPageAction) ||
                (btnId == window[multiRecName].addNewAction) ||
                (btnId == window[multiRecName].selectAction) ||
                (btnId == window[multiRecName].jumpToAction)){
                if (signVerificationRqd(btnId)){
                        showFinacleSignature(btnId);
                }
                else {
                        return true;
                }
        }
        else
                return true;
}


var frm = null;
var isNfiuFlg = "empty";

function chngSurname(obj)
{
if((document.forms[0].acctNum.value == "") && (readCookie("partyType") != null))
{
alert("Account is mandatory for customer");
document.forms[0].surname.value = "";
}
_checkSpecialChars();
//alert(document.forms[0].surname.value);
if(document.forms[0].surname.value != ""){
	eraseCookie("surname");
    createCookie("surname",document.forms[0].surname.value.toUpperCase(),0);
  }
}


function chngFirstname(obj)
{
if((document.forms[0].acctNum.value == "") && (readCookie("partyType") != null))
{
alert("Account is mandatory for customer");
document.forms[0].firstname.value = "";
}
_checkSpecialChars();
//alert(document.forms[0].firstname.value);
if(document.forms[0].firstname.value != ""){
	eraseCookie("firstname");
    createCookie("firstname",document.forms[0].firstname.value.toUpperCase(),0);
  }
}

function chngMiddlename(obj)
{
if((document.forms[0].acctNum.value == "") && (readCookie("partyType") != null))
{
alert("Account is mandatory for customer");
document.forms[0].middlename.value = "";
}
_checkSpecialChars();
//alert(document.forms[0].middlename.value);
if(document.forms[0].middlename.value != ""){
eraseCookie("middlename");
    createCookie("middlename",document.forms[0].middlename.value.toUpperCase(),0);
  }
}

function chngAddress(obj)
{
if((document.forms[0].acctNum.value == "") && (readCookie("partyType") != null))
{
alert("Account is mandatory for customer");
document.forms[0].address.value = "";
}

_checkSpecialChars();
if(document.forms[0].address.value != "")
createCookie("address",document.forms[0].address.value.toUpperCase(),0);
}

function chngPhoneNumber(obj)
{
if((document.forms[0].acctNum.value == "") && (readCookie("partyType") != null))
{
alert("Account is mandatory for customer");
document.forms[0].phoneNumber.value = "";
}

_checkSpecialChars();
if(document.forms[0].phoneNumber.value != "")
createCookie("phoneNumber",document.forms[0].phoneNumber.value.toUpperCase(),0);
}


function chngParticulars(obj)
{
document.forms[0].sourceOfFund.value != "";
if(document.forms[0].particulars.value != "")
createCookie("particulars",document.forms[0].particulars.value.toUpperCase(),0);
}

function chngIdNumber(obj)
{
if((document.forms[0].acctNum.value == "") && (readCookie("partyType") != null))
{
alert("Acct. Id is mandatory for customer");
document.forms[0].idNumber.value = "";
}

_checkSpecialChars();
if(document.forms[0].idNumber.value != "")
createCookie("idNumber",document.forms[0].idNumber.value.toUpperCase(),0);
}

function chngSource(obj)
{
_checkSpecialChars();

 if((document.forms[0].expiryDate.value !="") && (document.forms[0].expiryDate.value !=" ") && (document.forms[0].expiryDate.value !="null"))
{
}else{
alert("Fill Date Fields");
	document.forms[0].expiryDate_ui.value = "";
	document.forms[0].expiryDate.value = "";
     eraseCookie("expiryDate");

	document.forms[0].sourceOfFund.value = "";
return false;
}

 if((document.forms[0].issueDate.value !="") && (document.forms[0].issueDate.value !=" ") && (document.forms[0].issueDate.value !="null"))
{
}else{
alert("Fill Date Fields");
	document.forms[0].issueDate_ui.value ="";
	document.forms[0].issueDate.value ="";
	 eraseCookie("issueDate");
	document.forms[0].sourceOfFund.value = "";
return false;
}


if(document.forms[0].particulars.value =="NATIONAL ID")
  {
  // alert('national id');
   document.forms[0].expiryDate.value = "31-12-2099"; 
  eraseCookie("expiryDate");
  createCookie("expiryDate",document.forms[0].expiryDate.value,0); 
 }
//alert(tranDate);
//var vd = new Date(tranDate);

var td = new Date(tranDate);

var vd  = new Date(document.forms[0].valueDate.value);
var xp = new Date(document.forms[0].expiryDate.value);

 var  temp = tranDate.split("-");
 var reversedTranDate  = temp[2]+temp[1]+temp[0];

 temp = document.forms[0].expiryDate.value.split("-");
 var reversedExpiryDate  = temp[2]+temp[1]+temp[0];


//alert("txnDt  "+reversedTranDate+" xpiryDt "+reversedExpiryDate);
if(reversedTranDate  >= reversedExpiryDate)
        {
      alert("Document has expired..");
     document.forms[0].sourceOfFund.value = "";
     // document.forms[0].expiryDate.focus();y
      return false;
      }

 

   
 

 if((document.forms[0].sourceOfFund.value != "") && (document.forms[0].issueDate.value !="") && (document.forms[0].expiryDate.value !=""))
 {
   
  eraseCookie("source");
  createCookie("source",document.forms[0].sourceOfFund.value.toUpperCase(),0);
   //createCookie("tranDate",document.forms[0].valueDate.value, 0);
createCookie("tranDate",tranDate, 0);
//document.forms[0].issueDate.value = tranDate;
   createCookie("issueDate",document.forms[0].issueDate.value,0);
   createCookie("expiryDate",document.forms[0].expiryDate.value,0);
   }else{
    alert("fill date  fields");
	document.forms[0].issueDate_ui.value ="";
	document.forms[0].expiryDate_ui.value = "";
	document.forms[0].issueDate.value ="";
	document.forms[0].expiryDate.value = "";
    document.forms[0].sourceOfFund.value  = "";
    eraseCookie("issueDate");
 eraseCookie("expiryDate");
 eraseCookie("source");
  eraseCookie("tranDate");
 
   return false;
   }
  return true;
   //fnvalDate(document.forms[0].valueDate);
   //fnvalDate(document.forms[0].valueDate);
}

 
function post_ONLOAD(tmdet,obj){

   frm = document.forms[0];
    var stype = frm.tranSubType.value;
    if(mopId.toUpperCase() == "HXFER" )
    {      
	   document.getElementById("tranParticular").readOnly = true;
       document.getElementById("tranParticularsCode").readOnly = true;	   
	} 
    else
    {
	  document.getElementById("tranParticularsCode").readOnly = true;	 
	  document.getElementById("tranHxfer").disabled = true;
    } 

    if(mopId.toUpperCase() == "HCASHWD" )
    {   
	  
	    
	 
	    document.getElementById("instrType").readOnly = true;
       document.getElementById("tranParticular").readOnly = true;	
	   
	   
	   
	     
	} 
    else
    {
	  document.getElementById("instrType").disabled = true;
    } 		
	
	if(mopId.toUpperCase() == "HCASHDEP" )
    {      
       
	 
	    document.getElementById("instrType").readOnly = true;
       document.getElementById("tranParticular").readOnly = true;	
	   
	 
	     
	}
  if(funcCode == "A"){ 
 
if(document.forms[0].srlNum.value <= parseInt(readCookie("recCounter")))
{
//alert('backwards');
//frm.refAmt.value="";
//frm.acctId.value = "";

//frm.acctId.disabled=false;
//frm.refAmt.disabled=false;
}
  hidediv();
  validateHideShow();
   }

  if(readCookie("partyType") != null)
  {
	document.getElementById("partyTypeYes").checked = true;
	document.getElementById("partyTypeNo").checked = false;
	 document.forms[0].acctNum.disabled=false;

   }else{
	document.getElementById("partyTypeYes").checked = false;
     document.getElementById("partyTypeNo").checked = true;
	 document.forms[0].acctNum.disabled=true;
   }

  if(readCookie("acctNum") != null)
  {
 	document.forms[0].acctNum.value = readCookie("acctNum");
   }else{
	document.forms[0].acctNum.value = " ";
   }

   if(readCookie("surname") != null)
  {
  //document.forms[0].acctNum.value = readCookie("acctNum");
  document.forms[0].surname.value = readCookie("surname");
document.forms[0].firstname.value = readCookie("firstname");
document.forms[0].middlename.value = readCookie("middlename");
  document.forms[0].address.value = readCookie("address");
 document.forms[0].phoneNumber.value = readCookie("phoneNumber");
 document.forms[0].particulars.value = readCookie("particulars");
 document.forms[0].issueDate.value = readCookie("issueDate");
 document.forms[0].expiryDate.value = readCookie("expiryDate");
 document.forms[0].idNumber.value = readCookie("idNumber");
 document.forms[0].sourceOfFund.value = readCookie("source");
 document.forms[0].tranDate.value = readCookie("tranDate");
 document.forms[0].issueDate_ui.value = readCookie("issueDate");
 document.forms[0].expiryDate_ui.value = readCookie("expiryDate");
  setVals(readCookie("particulars"));
   showdiv();
  }
  setCustomFieldValue("surname","address","phoneNumber","particulars","issueDate","expiryDate","idNumber","sourceOfFund","tranDate","_details1","_details2","firstname","middlename");
  var scrName  = "nfiumn001.scr";
  var inputNameValues    = "foracid|"+frm.acctId.value;
  var outputNames = "code";
  retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
  //document.forms[0].tranDate.value =  document.forms[0].valueDate.value;
createCookie("tranDate",tranDate, 0);


 		document.forms[0].acctNum.value="";
                document.forms[0].surname.value="";
		 document.forms[0].firstname.value="";
		document.forms[0].middlename.value="";
                document.forms[0].address.value="";
                document.forms[0].phoneNumber.value="";
                document.forms[0].particulars.value="";
                document.forms[0].idNumber.value="";
                document.forms[0].issueDate.value="";
                document.forms[0].expiryDate.value="";
 		  document.forms[0].issueDate_ui.value="";
                document.forms[0].expiryDate_ui.value="";

                document.forms[0].sourceOfFund.value="";


   if(funcCode != "A"){
  hidediv();
   }
 if(funcCode == "P")
 {

// Radio button for TTL
        var tttranId = tranId;
    	var ttdate = document.forms[0].valueDate.value;        
        var inputNameValues = "fTranId|"+tttranId + "|tranDate|" + ttdate;
        var scrName = "custtrantype1.scr";
        var outputNames = "radValue";
        retval = appFnExecuteScript(inputNameValues,outputNames,scrName,true);
	var vctype = document.forms[0].radValue.value;
	if (vctype == "A")
        {
     	 for (var i = 0;i< document.forms[0].tranCustType.length;i++)
      	  {
      	   if(document.forms[0].tranCustType[i].value == "ahdCus"){
              document.forms[0].tranCustType[i].checked = true;
                       
           }

      	  }

         }

        if (vctype == "T")
        {
     	 for (var i = 0;i< document.forms[0].tranCustType.length;i++)
      	  {
      	   if(document.forms[0].tranCustType[i].value == "trdCus"){
              document.forms[0].tranCustType[i].checked = true;
                       
           }

      	  }

         }


//end of TTL radio button

 }

}


function isFormFilled()
{
if(isNfiuFlg != "empty")
{
 	 	//alert(document.getElementById("partyTypeYes").value);
		//alert(readCookie("partyType"));
	//if(document.getElementById("partyTypeYes").value == "Y")
	 if(readCookie("partyTypeYes") != null)
	{
	if(document.forms[0].acctNum.value == "")
	  {
		alert("Acct. Id is mandatory for customer");
		document.forms[0].acctNum.focus();	
		return false;
	  }
	}	 

 if((document.forms[0].surname.value =="") || (document.forms[0].surname.value ==" ") || (document.forms[0].surname.value =="null"))
   {
   alert("Surname has to be entered");
   document.forms[0].surname.focus();
   return "no";
   }

if((document.forms[0].firstname.value =="") || (document.forms[0].firstname.value ==" ")|| (document.forms[0].firstname.value =="null"))
   {
   alert("Firstname has to be entered");
   document.forms[0].firstname.focus();
   return "no";
   }

if((document.forms[0].middlename.value =="")||(document.forms[0].middlename.value ==" ") || (document.forms[0].middlename.value =="null"))
   {
   alert("Middlename has to be entered");
   document.forms[0].middlename.focus();
   return "no";
   }

  if((document.forms[0].address.value =="") || (document.forms[0].address.value ==" ") || (document.forms[0].address.value =="null"))
   {
   alert("Address has to be entered");
   document.forms[0].address.focus();
   return "no";
   }
  if((document.forms[0].phoneNumber.value =="") || (document.forms[0].phoneNumber.value ==" ") || (document.forms[0].phoneNumber.value =="null"))
   {
   alert("Phonenumber has to be entered");
   document.forms[0].phoneNumber.focus();
   return "no";
   }

 if(document.forms[0].particulars.value =="NATIONAL ID")
  {
  // alert('national id');
   //document.forms[0].expiryDate.value = "31-12-2099"; 
  //eraseCookie("expiryDate");
  //createCookie("expiryDate",document.forms[0].expiryDate.value,0); 
 }

 if((document.forms[0].particulars.value =="") || (document.forms[0].particulars.value ==" "))
   {
   alert("Select ID type ");
   document.forms[0].particulars.focus();
   return "no";
   }

  if((document.forms[0].issueDate.value =="") || (document.forms[0].issueDate.value == "null") || (document.forms[0].issueDate.value == " "))
   {
   alert("Issue date has to be entered");
   document.forms[0].issueDate.focus();
   document.forms[0].sourceOfFund.value = "";
   return "no";
   }
  if((document.forms[0].expiryDate.value =="")|| (document.forms[0].expiryDate.value == "null") || (document.forms[0].expiryDate.value == " "))
   {
   alert("Expiry date has to be entered");
   document.forms[0].expiryDate.focus();
    document.forms[0].sourceOfFund.value = "";
   return "no";
   }
  if(document.forms[0].idNumber.value =="")
   {
   alert("ID number has to be entered");
   document.forms[0].idNumber.focus();
   return "no";
   }
   if((document.forms[0].sourceOfFund.value =="") || (document.forms[0].sourceOfFund.value == "null") || (document.forms[0].sourceOfFund.value == " "))
   {
   alert("Source of fund has to be entered");
   document.forms[0].sourceOfFund.focus();
   return "no";
   }
 }//isNfiuFlg 

 return "yes";
} 


function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}


 function tmdet_pre_ONCLICK(tmdet,obj)
 {
if(mopid =="HCASHWD"){
  alert("Note the required fields");
if(pTranType =="D"){
if(instrType =="CHQ"){
 alert("shuaib");
 
return false;
 }
}
}
  
  }



 function validateHideShow()
 {
	 

   var amount  = fnRemoveCommas(frm.refAmt.value);
 if((funcCode == "A") && ( frm.refAmt.value != "") && (acctId != ""))
  {
   if((frm.acctCrncy.value != "NGN")  && ((document.forms[0].code.value == "R")  || (document.forms[0].code.value == "C")))
   {

     if(isFormFilled() != "yes")
      {
       alert('NFIU Form not filled!');
        return false;
      }
   }else{

      if(((amount >= 1000000.00)  && (document.forms[0].code.value == "R")) || (( amount >= 5000000.00)  && (document.forms[0].code.value == "C")))
        {
         if(isFormFilled() != "yes")
            {
               alert('NFIU Form not filled!');
               return false;
            }
        }else{
         //alert('form filled');
         return true;
        }
    }
   return true;
 }


   return true;

 //  createCookie("tranDate",document.forms[0].valueDate.value, 0);
}

function tmdet_ONCLICK17(obj,p1)
{
	//alert("submit");
    var chck = isFormFilled();
   if( chck != "yes")
   {
   return false;
   }
 
        var retVal = "";
        if (preEventCall('tmdet',obj,'ONCLICK') == false) {
                return false;
        }
        if ((retVal = fnOnButtonClick(p1)) == false) {
                return false;
        }
        if (postEventCall('tmdet',obj,'ONCLICK') == false) {
                return false;
        }
        return (retVal == undefined) ? true : retVal;
}

function sssave()
{
  //if(frm.tranType.value=="C"){
 //alert("Change test");
              eraseCookie("cifId1");
              eraseCookie("acctNum1"); 
              eraseCookie("chrgAmt1");
              eraseCookie("chrgbAmt1"); 
              eraseCookie("chrgVat1"); 
              eraseCookie("tranSubType1"); 
              eraseCookie("type1"); 
              eraseCookie("currencyT1"); 
              eraseCookie("tranCustType1");
              eraseCookie("maa1");

	var frm = document.forms[0];
        var acct = (frm.acctId.value).toUpperCase();
        var vinstrType = frm.instrType.value;
        var vtranCustType = get_radio_value();
//				if(vtranCustType == null || vtranCustType ==" " )
//	{
//			alert("you must select customer type (either third party or account holder radio button)");
//			doSubmit(this.id);
//	}
      var cnyt = document.forms[0].refCrncy.value;
         var amt = frm.refAmt.value;
        var type = frm.tranType.value;
         var stype = frm.tranSubType.value;
         var tdate = frm.valueDate.value;
         var inputNameValues ="acctNum|"+acct+"|tranAmt|"+amt+"|tranType|"+type+"|tranSubType|"+stype+"|tranDate|"+tdate+"|instrType|"+vinstrType+"|tranCustType|"+vtranCustType+"|currencyT|"+cnyt;
        var scrName = "newcashlite.scr";
        var outputNames ="chrgbAmt|chrgAmt|chrgVat|totAmt|cifId|type|tpchk|availFlg";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
      var ca = document.forms[0].chrgAmt.value;
      var sa = document.forms[0].chrgbAmt.value;
      var va = document.forms[0].chrgVat.value;
      var ta = document.forms[0].totAmt.value;
      var tta= document.forms[0].cifId.value;
      var rs = document.forms[0].type.value;
      var cny = document.forms[0].refCrncy.value;
      var chy = document.forms[0].tpchk.value;
	  var avl = document.forms[0].availFlg.value;
	  
	  if(avl == "1")
	{ 
		  alert("Sum of transaction amount and cashlite charges exceeded available balance in this account");
		  //return false;
		  doSubmit(this.id);
	}
	else
	{
      function get_radio_value()
     {
      for (var i = 0;i< frm.tranCustType.length;i++)
        {
         if(frm.tranCustType[i].checked)
           {
            var rad_val = frm.tranCustType[i].value;
           }

       } 
      return rad_val;
     }

     if(chy == "F")
     {
       alert("Cheque above 150000 can not be collected across counter,please go through clearing ");
      // return false;
	   doSubmit(this.id);
     }
    
       var radchk1 = get_radio_value();
       ca *=100 ;
       ca = Math.round(ca);
       ca /= 100;

       sa *=100 ;
       sa = Math.round(sa);
       sa /= 100;

       va *=100 ;
       va = Math.round(va);
       va /= 100;

       ta *=100 ;
       ta = Math.round(ta);
       ta /= 100;
        eraseCookie("tranCustType1");
       createCookie("tranCustType1",radchk1,0);

      if(ca > 0)
     {
             var mesg = "The transaction amount has exceeded the daily CASHLESS limit,so it will be charged with #";
              mesg = mesg + ca + " and VAT #" + va +" making a total of #" + ta
             mesg = mesg + " on  #"
             mesg = mesg + sa
             mesg = mesg + " . Do you want to continue? Click ok to continue with the charge or click cancel to terminate transaction."
            var maa = confirm(mesg);
			  if(maa == 0)
           {
                         // return false;
			  doSubmit(this.id);
            

           }

       eraseCookie("cifId1");
       createCookie("cifId1",frm.cifId.value,0);
       eraseCookie("acctNum1");
       createCookie("acctNum1",acct,0);
        eraseCookie("chrgAmt1");
       createCookie("chrgAmt1",document.forms[0].chrgAmt.value,0);
        eraseCookie("chrgVat1");
       createCookie("chrgVat1",va,0);
        eraseCookie("tranSubType1");
       createCookie("tranSubType1",stype,0);
       eraseCookie("currencyT1");
       createCookie("currencyT1",cny,0);
        eraseCookie("chrgbAmt1");
       createCookie("chrgbAmt1",sa,0);
        eraseCookie("type1");
       createCookie("type1",rs,0);
        eraseCookie("tranCustType1");
       createCookie("tranCustType1",radchk1,0);
        eraseCookie("maa1");
       createCookie("maa1"," ",0);
         
     } 
	}//end available balance if
//Below bracket is for the condition if C
 // }
 
  //************* Above Credit Limit
 		 var acctno = document.forms[0].acctId.value;
	     var tranamt = document.forms[0].refAmt.value;
         var Ttype = document.forms[0].tranType.value;
         var Tstype = document.forms[0].tranSubType.value;
		 var currny = document.forms[0].refCrncy.value;
		 partran = getRadioValue(document.forms[0].pTranType);
	     var inputNameValues ="foracid|"+acctno+"|transamt|"+tranamt+"|tranSubType|"+Tstype;
		 var scrName = "transAbove500T.scr";
         var outputNames ="availflg|maxAmt|schmdesc";
         retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	     var avg = document.forms[0].availflg.value;
		 var maxAmt2 = document.forms[0].maxAmt.value;
		 var schmcode2 = document.forms[0].schmdesc.value;
		if (partran == "C")
         {
        	if (avg == "N")
	        {
			var pppp = "Balance will be greater than maximum limit of ";
              pppp = pppp + maxAmt2 + " set on " + schmcode2
              pppp = pppp +". Kindly advice customer to upgrade to normal Savings account."
              alert(pppp);
		      document.forms[0].refAmt.focus();
			  document.forms[0].submit();
	        }
	//		else
	//		 {
	//			return true;
	//		 }

         }

//**************************



}

function sssave1()
{
  
              eraseCookie("cifId1");
              eraseCookie("acctNum1"); 
              eraseCookie("chrgAmt1");
              eraseCookie("chrgbAmt1"); 
              eraseCookie("chrgVat1"); 
              eraseCookie("tranSubType1"); 
              eraseCookie("type1"); 
              eraseCookie("currencyT1"); 
              eraseCookie("tranCustType1");
              eraseCookie("maa1");

	var frm = document.forms[0];
        var acct = (frm.acctId.value).toUpperCase();
        var vinstrType = frm.instrType.value;
        var vtranCustType = get_radio_value();
      var cnyt = document.forms[0].refCrncy.value;
         var amt = frm.refAmt.value;
        var type = frm.tranType.value;
         var stype = frm.tranSubType.value;
         var tdate = frm.valueDate.value;
         var inputNameValues ="acctNum|"+acct+"|tranAmt|"+amt+"|tranType|"+type+"|tranSubType|"+stype+"|tranDate|"+tdate+"|instrType|"+vinstrType+"|tranCustType|"+vtranCustType+"|currencyT|"+cnyt;
        var scrName = "newcashlite.scr";
        var outputNames ="chrgbAmt|chrgAmt|chrgVat|totAmt|cifId|type|tpchk|availFlg";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
      var ca = document.forms[0].chrgAmt.value;
      var sa = document.forms[0].chrgbAmt.value;
      var va = document.forms[0].chrgVat.value;
      var ta = document.forms[0].totAmt.value;
      var tta= document.forms[0].cifId.value;
      var rs = document.forms[0].type.value;
      var cny = document.forms[0].refCrncy.value;
      var chy = document.forms[0].tpchk.value;
	  var avl = document.forms[0].availFlg.value;
	  
	  if(avl == "1")
	{ 
		  alert("Sum of transaction amount and cashlite charges exceeded available balance in this account");
		 // return false;
		  doSubmit(this.id);

	}
	else
	{
      function get_radio_value()
     {
      for (var i = 0;i< frm.tranCustType.length;i++)
        {
         if(frm.tranCustType[i].checked)
           {
            var rad_val = frm.tranCustType[i].value;
           }

       } 
      return rad_val;
     }

     if(chy == "F")
     {
       alert("Cheque above 150000 can not be collected across counter,please go through clearing ");
      // return false;
	   doSubmit(this.id);
     }
    
       var radchk = get_radio_value();
       ca *=100 ;
       ca = Math.round(ca);
       ca /= 100;

       sa *=100 ;
       sa = Math.round(sa);
       sa /= 100;

       va *=100 ;
       va = Math.round(va);
       va /= 100;

       ta *=100 ;
       ta = Math.round(ta);
       ta /= 100;
      if(ca > 0)
     {
             var mesg = "The transaction amount has exceeded the daily CASHLESS limit,so it will be charged with #";
              mesg = mesg + ca + " and VAT #" + va +" making a total of #" + ta
             mesg = mesg + " on  #"
             mesg = mesg + sa
             mesg = mesg + " . Do you want to continue? Click ok to continue with the charge or click cancel to terminate transaction."
            var maa = confirm(mesg);

       eraseCookie("cifId1");
       createCookie("cifId1",frm.cifId.value,0);
       eraseCookie("acctNum1");
       createCookie("acctNum1",acct,0);
        eraseCookie("chrgAmt1");
       createCookie("chrgAmt1",document.forms[0].chrgAmt.value,0);
        eraseCookie("chrgVat1");
       createCookie("chrgVat1",va,0);
        eraseCookie("tranSubType1");
       createCookie("tranSubType1",stype,0);
       eraseCookie("currencyT1");
       createCookie("currencyT1",cny,0);
        eraseCookie("chrgbAmt1");
       createCookie("chrgbAmt1",sa,0);
        eraseCookie("type1");
       createCookie("type1",rs,0);
        eraseCookie("tranCustType1");
       createCookie("tranCustType1",radchk,0);
        eraseCookie("maa1");
       createCookie("maa1",maa,0);

           if(maa == 0)
           {
             // return false;
              doSubmit(this.id);

           }
     } 
	}//end available balance if


}

function callCreditCardRestrict()
{
	
   if(funcCode == "A" || funcCode == "P" || funcCode == "M"  ) {
	   var frm = document.forms[0];
        var acct = (frm.acctId.value).toUpperCase();  
		 var type =  getRadioValue(frm.pTranType);
         var stype = frm.tranSubType.value;
		 var amt = frm.refAmt.value;
		  var inputNameValues ="foracid|"+acct+"|pTranType|"+type+"|tranSubType|"+stype+"|transamt|"+ amt;
        var scrName = "creditcardrestrict.scr";
       var outputNames ="cardsuccessOrFailure|sign";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
      var cardsuccess = document.forms[0].cardsuccessOrFailure.value;
      var sign = document.forms[0].sign.value;
	  
        if(cardsuccess == "Y")
	    {
	      if (sign == "F")
		  { 	     
		    return 1;
		     
		  }
		  else
		  {
		    return 0;
		  }	    
	   }
	   else
	  {
	    if(sign != "F")
		{
		 return 0;
		}
		else
		{
		return 1;
		}
	   
	}

  }
}

function tmdet_ONCLICK18(obj,p1)
{
   
	 //Start Document Validation
	 eraseCookie("dis1");  
	 var actno = (document.forms[0].acctId.value).toUpperCase();
	 var inputNameValues ="foracid|"+actno;
     var scrName = "documentValidation.scr";
     var outputNames ="display";
     retVal1 = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	 var dis = document.forms[0].display.value;
	  
	   if (dis != "")
	   {
		var alertnewmsg = "Account " + actno + " with following incomplete Documentation(s)";
       alertnewmsg = alertnewmsg + dis + "  Do you want to continue? Click ok to continue or click cancel to terminate transaction."
       sss = confirm(alertnewmsg);
	   if(sss == 0)
         { 
		   document.forms[0].submit();
		//   return false;
         }

	   }
	   eraseCookie("dis1");
       createCookie("dis1",dis,0);
//End document Validation

	          eraseCookie("cifId1");
              eraseCookie("acctNum1"); 
              eraseCookie("chrgAmt1");
              eraseCookie("chrgbAmt1"); 
              eraseCookie("chrgVat1"); 
              eraseCookie("tranSubType1"); 
              eraseCookie("type1"); 
              eraseCookie("currencyT1"); 
              eraseCookie("tranCustType1");
              eraseCookie("maa1");

   var type = frm.tranType.value;
    var stype = frm.tranSubType.value;                

		

	if((funcCode == "A" || funcCode == "P" || (funcCode == "M"  && frm.tranParticularsCode.checked == false)))
 {
	var t = maxcredit();
	result = t.split('|') 
	partran = result[3]
	schmcode2 = result[2]
	maxAmt2 = result[1]
	avg = result[0]
	
	
	  if(partran == "C")
	   {
		if (avg == "N")
	        {
			var pppp = "Balance will be greater than maximum limit of ";
              pppp = pppp + maxAmt2 + " set on " + schmcode2
              pppp = pppp +". Kindly advice customer to upgrade to normal Savings account."
              alert(pppp);
		      document.forms[0].refAmt.focus();
			  return false;
			}
		
		}
 }
 
       var domchrg01 = ChargeDomAccount();
	    if (domchrg01 == 1)
	   {
	      alert("Sum of transaction amount and commission charges exceeds available balance");
	       document.forms[0].acctId.focus();
	         return false;
	   }
 
  var cardC = callCreditCardRestrict();
			if (cardC == 1)
			{
			  alert("This account can not be debited.");
		      document.forms[0].acctId.focus();
		     return false;
			}
			else
			{
			
			  if((funcCode == "A" || funcCode == "P" || (funcCode == "M"  && frm.tranParticularsCode.checked == false)) && type  == "C" ){
         
		//Over The Counter Charges Save
var f = amtchk(document.forms[0].acctId.value,document.forms[0].refAmt.value)
		
		if (f == 1 )
		{
		   alert("Insufficient funds to cater for over the counter charge");
		     document.forms[0].refAmt.focus();
			 return false;

		}  
		if (f == 0 )
	    {
		  var maxamt = document.forms[0].fixedamt.value
		  if (document.forms[0].refAmt.value < maxamt)
		  {
		   	 var alertmsg = "This transaction will attract Counter charge";
             alertmsg = alertmsg + " . Do you want to continue? Click ok to continue with the charge or click cancel to terminate transaction."
             kkk = confirm(alertmsg);
			 
		     if(!kkk)
             {
				document.forms[0].refAmt.focus();
			    return false;	
			  //document.forms[0].submit();
             }
			 else
			 {
			  sssave();
			  
			 }
			 
		  } 
	    }
		if (f == 2 )
		{
		     alert("Over The Counter Charge Selection Failed");
		     document.forms[0].refAmt.focus();
			 return false;

		}  

//**********************End Over the Counter Charges***********

		
    }
			
			}

	 

 if( validateHideShow())
{
  if(readCookie("surname") != null)
  {
  document.forms[0].surname.value = readCookie("surname");
document.forms[0].firstname.value = readCookie("firstname");
document.forms[0].middlename.value = readCookie("middlename");
  document.forms[0].address.value = readCookie("address");
 document.forms[0].phoneNumber.value = readCookie("phoneNumber");
 document.forms[0].particulars.value = readCookie("particulars");
 document.forms[0].issueDate.value = readCookie("issueDate");
 document.forms[0].expiryDate.value = readCookie("expiryDate");
 document.forms[0].idNumber.value = readCookie("idNumber");
 document.forms[0].sourceOfFund.value = readCookie("source");
 document.forms[0].tranDate.value = readCookie("tranDate");
  }
    setCustomFieldValue("surname","address","phoneNumber","particulars","issueDate","expiryDate","idNumber","sourceOfFund","tranDate","_details1","_details2","firstname","middlename");
    //alert('19');
    var chck = isFormFilled();
   if( chck != "yes")
   {
   return false;
   }
    }	
	else
	{
     return false;
   }// validateHideShow()
 

        var retVal = "";
        if (preEventCall('tmdet',obj,'ONCLICK') == false) {
                return false;
        }
        if ((retVal = fnOnButtonClick(p1)) == false) {
                return false;
        }
        if (postEventCall('tmdet',obj,'ONCLICK') == false) {
                return false;
        }
        return (retVal == undefined) ? true : retVal;
}


//****************
//New Over Counter
 function get_radio_value()
     {
      for (var i = 0;i< frm.tranCustType.length;i++)
        {
         if(frm.tranCustType[i].checked)
           {
            var rad_val = frm.tranCustType[i].value;
           }

       } 
      return rad_val;
     }

function amtchk(acctid,acctamt)
{
         var Ttype = document.forms[0].tranType.value;
         var Tstype = document.forms[0].tranSubType.value;		 
		 var currny = document.forms[0].refCrncy.value;
		 var newCustType = get_radio_value();
		 if (newCustType == "trdCus")
		 {
			 custype = "thirdparty";
		 }
		 else{
			 custype = "acctholder";
		 }
		 	 eraseCookie("custype1");
			 createCookie("custype1",custype,0);
	     var inputNameValues ="foracid|"+acctid+"|transamt|"+acctamt+"|tranSubType|"+Tstype+"|currencyT|"+currny+"|cusType|"+custype;
 //	     var inputNameValues ="foracid|"+acctid+"|transamt|"+acctamt+"|tranSubType|"+Tstype+"|currencyT|"+currny;
      //   alert(inputNameValues);
		 var scrName = "overCounter.scr";
         var outputNames ="availflg|fixedamt";
         retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	     var avg = document.forms[0].availflg.value;
		 var maxamt = document.forms[0].fixedamt.value;
         if (Ttype == "C" && Tstype == "NP")
         {
        	if (avg == "N")
	        {
				return  1;
	        }
			else if (avg == "F")
			{
				return  2;
	        }
			else
			 {
				return 0;
			 }

         }

}


function tmdet_ONCLICK19(obj,p1)
{
     eraseCookie("dis1");  
	 var actno = (document.forms[0].acctId.value).toUpperCase();
	 var inputNameValues ="foracid|"+actno;
     var scrName = "documentValidation.scr";
     var outputNames ="display";
     retVal1 = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	 var dis = document.forms[0].display.value;
	  
	   if (dis != "")
	   {
		var alertnewmsg = "Account " + actno + " with following incomplete Documentation(s)";
       alertnewmsg = alertnewmsg + dis + "  Do you want to continue? Click ok to continue or click cancel to terminate transaction."
       sss = confirm(alertnewmsg);
	   if(sss == 0)
         { 
		   document.forms[0].submit();
		  // return false;
         }

	   }
	   eraseCookie("dis1");
       createCookie("dis1",dis,0);



if( validateHideShow())
{
  if(readCookie("surname") != null)
  {
  document.forms[0].surname.value = readCookie("surname");
document.forms[0].firstname.value = readCookie("firstname");
document.forms[0].middlename.value = readCookie("middlename");
  document.forms[0].address.value = readCookie("address");
 document.forms[0].phoneNumber.value = readCookie("phoneNumber");
 document.forms[0].particulars.value = readCookie("particulars");
 document.forms[0].issueDate.value = readCookie("issueDate");
 document.forms[0].expiryDate.value = readCookie("expiryDate");
 document.forms[0].idNumber.value = readCookie("idNumber");
 document.forms[0].sourceOfFund.value = readCookie("source");
 document.forms[0].tranDate.value = readCookie("tranDate");
  }
    setCustomFieldValue("surname","address","phoneNumber","particulars","issueDate","expiryDate","idNumber","sourceOfFund","tranDate","_details1","_details2","firstname","middlename"); 
    //alert('19');
    var chck = isFormFilled();
   if( chck != "yes")
   {
   return false;
   }
    }
	else
	{
    return false;
     }// validateHideShow()

  //*************************************
//Over the Counter Charge begins
    eraseCookie("fixedamt1");
	eraseCookie("tranSubType5");
	eraseCookie("currencyT5");

	var t = maxcredit();
	result = t.split('|')
	partran = result[3]
	schmcode2 = result[2]
	maxAmt2 = result[1]
	avg = result[0]
	
	if(partran == "C")
	{
	if (avg == "N")
	        {
			var pppp = "Balance will be greater than maximum limit of ";
              pppp = pppp + maxAmt2 + " set on " + schmcode2
              pppp = pppp +". Kindly advice customer to upgrade to normal Savings account."
              alert(pppp);
		      document.forms[0].refAmt.focus();
			  return false;
	        }

 
    }
//		}  
//***************************
              eraseCookie("cifId1");
              eraseCookie("acctNum1"); 
              eraseCookie("chrgAmt1");
              eraseCookie("chrgbAmt1"); 
              eraseCookie("chrgVat1"); 
              eraseCookie("tranSubType1"); 
              eraseCookie("type1"); 
              eraseCookie("currencyT1"); 
              eraseCookie("tranCustType1");
              eraseCookie("maa1");
	var frm = document.forms[0];
        var acct = (frm.acctId.value).toUpperCase();
        var vinstrType = frm.instrType.value;
        var vtranCustType = get_radio_value();
	var cscsh = frm.tranType.value;
  
   var type = frm.tranType.value;
    var stype = frm.tranSubType.value;                

   if((funcCode == "A"  || funcCode == "P" || (funcCode == "M"  && frm.tranParticularsCode.checked == false)) && type  == "C" )
   {

		if(vtranCustType == null || vtranCustType ==" " )
	{
			alert("you must select customer type (either third party or account holder radio button)")
			return false;
	}
      var cnyt = document.forms[0].refCrncy.value;
         var amt = frm.refAmt.value;
        var type = frm.tranType.value;
         var stype = frm.tranSubType.value;
         var tdate = frm.valueDate.value;
         var inputNameValues ="acctNum|"+acct+"|tranAmt|"+amt+"|tranType|"+type+"|tranSubType|"+stype+"|tranDate|"+tdate+"|instrType|"+vinstrType+"|tranCustType|"+vtranCustType+"|currencyT|"+cnyt;
        var scrName = "newcashlite.scr";
        var outputNames ="chrgbAmt|chrgAmt|chrgVat|totAmt|cifId|type|tpchk|availFlg";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
      var ca = document.forms[0].chrgAmt.value;
      var sa = document.forms[0].chrgbAmt.value;
      var va = document.forms[0].chrgVat.value;
      var ta = document.forms[0].totAmt.value;
      var tta= document.forms[0].cifId.value;
      var rs = document.forms[0].type.value;
      var cny = document.forms[0].refCrncy.value;
      var chy = document.forms[0].tpchk.value;
	  var avl = document.forms[0].availFlg.value;
	  
	  if(avl == "1")
	{ 
		  alert("Sum of transaction amount and cashlite charges exceeded available balance in this account");
		  //return false;
		  doSubmit(this.id);

	}
	else
	{
      function get_radio_value()
     {
      for (var i = 0;i< frm.tranCustType.length;i++)
        {
         if(frm.tranCustType[i].checked)
           {
            var rad_val = frm.tranCustType[i].value;
           }

       } 
      return rad_val;
     }

     if(chy == "F")
     {
       alert("Cheque above 150000 can not be collected across counter,please go through clearing ");
      // return false;
	   doSubmit(this.id);
     }
    
       var radchk = get_radio_value();
       ca *=100 ;
       ca = Math.round(ca);
       ca /= 100;

       sa *=100 ;
       sa = Math.round(sa);
       sa /= 100;

       va *=100 ;
       va = Math.round(va);
       va /= 100;

       ta *=100 ;
       ta = Math.round(ta);
       ta /= 100;
      if(ca > 0)
     {
             var mesg = "The transaction amount has exceeded the daily CASHLESS limit,so it will be charged with #";
              mesg = mesg + ca + " and VAT #" + va +" making a total of #" + ta
             mesg = mesg + " on  #"
             mesg = mesg + sa
             mesg = mesg + " . Do you want to continue? Click ok to continue with the charge or click cancel to terminate transaction."
            var maa = confirm(mesg);
       
       eraseCookie("cifId1");
       createCookie("cifId1",frm.cifId.value,0);
       eraseCookie("acctNum1");
       createCookie("acctNum1",acct,0);
        eraseCookie("chrgAmt1");
       createCookie("chrgAmt1",document.forms[0].chrgAmt.value,0);
        eraseCookie("chrgVat1");
       createCookie("chrgVat1",va,0);
        eraseCookie("tranSubType1");
       createCookie("tranSubType1",stype,0);
       eraseCookie("currencyT1");
       createCookie("currencyT1",cny,0);
        eraseCookie("chrgbAmt1");
       createCookie("chrgbAmt1",sa,0);
        eraseCookie("type1");
       createCookie("type1",rs,0);
        eraseCookie("tranCustType1");
       createCookie("tranCustType1",radchk,0);
        eraseCookie("maa1");
       createCookie("maa1",maa,0);
         
           if(maa == 0)
           {
			  doSubmit(this.id);
              

           }
     } 
	}//end available balance if
	
	
	//Post over the counter charges
	var f = amtchk(document.forms[0].acctId.value,document.forms[0].refAmt.value)
		//alert(f);
		if (f == 1 )
		{
		   alert("Insufficient funds to cater for over the counter charge");
		     document.forms[0].refAmt.focus();
			 return false;

		}  
		if (f == 0 )
	    {
		
		     var maxamt = document.forms[0].fixedamt.value
			
		     if (document.forms[0].refAmt.value < maxamt)
			{
		   	    var alertmsg = "This transaction will attract Counter charge";
                alertmsg = alertmsg + " . Do you want to continue? Click ok to continue with the charge or click cancel to terminate transaction."
                kkk = confirm(alertmsg);

		      if(kkk == 0)
               { 
			    document.forms[0].submit();
               }
		    } 
	    }
       if (f == 2 )
		{
		   alert("Over The Counter Charge Selection Failed");
		     document.forms[0].refAmt.focus();
			 return false;

		}  
		
		var cardC = callCreditCardRestrict();
			
			if (cardC == 1)
			{
			  alert("This account can not be debited.");
		      document.forms[0].acctId.focus();
		     return false;
			}
	   
	   var domchrg01 = ChargeDomAccount();
	    if (domchrg01 == 1)
	   {
	      alert("Sum of transaction amount and commission charges exceeds available balance");
	       document.forms[0].acctId.focus();
	         return false;
	    }
	
	
	
 }   //end if cash


        var retVal = "";
        if (preEventCall('tmdet',obj,'ONCLICK') == false) {
                return false;
        }
        if ((retVal = fnOnButtonClick(p1)) == false) {
                return false;
        }
        if (postEventCall('tmdet',obj,'ONCLICK') == false) {
                return false;
        }

        return (retVal == undefined) ? true : retVal;
//if(maa == 0){
// return false;
// }//end cancel if
//}//end charge not zero
   //below bracket is for the chhange
	// }

}


function ChargeDomAccount()
{
        var retval = 0;
        var frm = document.forms[0];
        var acct = (frm.acctId.value).toUpperCase();  
	    var amt = frm.refAmt.value;
        var type = frm.tranType.value;
         var stype = frm.tranSubType.value;
		 var curr = frm.refCrncy.value;
       if( curr != "NGN" ) {
         var inputNameValues ="foracid|"+acct+"|transamt|"+amt+"|tranSubType|"+stype+"|currencyT|"+curr;
        var scrName = "domiciliaryChrg001.scr";
        var outputNames = "flagout"; //"chrgbAmt|chrgAmt|chrgVat|totAmt|cifId|type|tpchk|availFlg";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	    var noneALERT = document.forms[0].flagout.value;
		//alert(noneALERT);
		if (noneALERT == "S")
		{
		 retval = 0;
		}else {
		  retval = 1;
		}
		 
	   }else {
	      retval = 0;
	      
	   }
	   
	   
	   return retval;
}

function AlertDisplay()
{
	
   if(funcCode == "A" || funcCode == "P" || funcCode == "M"  ) {
	   var frm = document.forms[0];
        var acct = (frm.acctId.value).toUpperCase();  
		 
	   var inputNameValues ="foracid|"+acct;
        var scrName = "msgAlert.scr";
       var outputNames ="MSGALERTsuccessOrFailure|MSGALERT";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
      var MSGALERTsuccessOrFailure = document.forms[0].MSGALERTsuccessOrFailure.value;
      var MSGALERT = document.forms[0].MSGALERT.value;
	  
        if(MSGALERTsuccessOrFailure == "Y")  {
			alert(MSGALERT);
	      return 0;
	   }
	   else
	  {
	   
		return 1;
		
	   
	  }

  }
}
function RestrictDom()
{

  var acct = document.forms[0].acctId.value;
   var cnyt = document.forms[0].refCrncy.value;
   var amt = document.forms[0].refAmt.value;
   var type = document.forms[0].tranType.value;
   var stype = document.forms[0].tranSubType.value;
   var tdate = document.forms[0].valueDate.value;
   var soll = jsUtil.encodeChar(initSolId);
    //alert(soll);

   if(funcCode == "A" || funcCode == "P" || funcCode == "M"  ) {
        var inputNameValues ="foracid|"+acct+"|tranSubType|"+stype+"|currencyT|"+cnyt;
        var scrName = "domRestrict001.scr";
        var outputNames = "domout"; 
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	    var block = document.forms[0].domout.value;
		//alert(block);
		 return block;
		
   }
   else 
   {
     return 0;
   }

}
function validatePTran(){

 if(mopId.toUpperCase() == "HCASHDEP" || mopId.toUpperCase() == "HCASHWD" )
    {
	    if(frm.refNum.value == "") {
			      alert("Refno field can not be empty");
				   frm.refNum.focus();
				    return false;
		          } else if(frm.tranRmks.value == "") {
			         alert("Depositor field can not be empty")
				      frm.tranRmks.focus();
				    return false;
			       } 
	
	}
	var restrictDom = RestrictDom();
	if (restrictDom == "D")
	{
	  alert("Cash deposit not allowed into this account.");
	  document.forms[0].acctId.focus();
	 return false;
	}
	
	if (restrictDom == "W")
	{
	  alert("Cash withrawal not allowed into this account.");
	  document.forms[0].acctId.focus();
	 return false;
	} 
	
	if (restrictDom == "T")
	{
	  alert("Only Trade Services can effect transfer on this acccount.");
	  document.forms[0].acctId.focus();
	 return false;
	}
	var alertdis = AlertDisplay();
	var cardC = callCreditCardRestrict();
	if (cardC == 1)
	{
	  alert("This account can not be debited.");
	  document.forms[0].acctId.focus();
	 return false;
	}
	if (isNewRec && isAcctValid != 'true') {
		alert(finbranchResArr.get("FAT000139"));
		frm.acctId.focus();
		return false;
	}

	// ===============Radio button compulsory ========================
	if((funcCode == "A"  || (funcCode == "M"  && document.forms[0].tranParticularsCode.checked == false)) && document.forms[0].tranType.value  == "C" )
	{
	var vtranCustType1 = get_radio_value1();
	if(vtranCustType1 == null || vtranCustType1 ==" " )
	{
			alert("you must select customer type (either third party or account holder radio button)");
			return false;
	}

	if(vtranCustType1 == "ahdCus")
	{	
	
     var Aftran = document.forms[0].tranParticular.value.substring(0,1);
	 if(Aftran == "A")
	 { 
	   var lentranParticular = document.forms[0].tranParticular.value.length;				 
		if (lentranParticular > 50)
		 { 
		  document.forms[0].tranParticular.value = frm.tranParticular.value.substring(0,49)
		 }
	 
	  } else {
	    document.forms[0].tranParticular.value = "A" + document.forms[0].tranParticular.value;		
		var lentranParticular = document.forms[0].tranParticular.value.length;
				 
		if (lentranParticular > 50)
		{ 
		 document.forms[0].tranParticular.value = frm.tranParticular.value.substring(0,49)
	    }
	 
	 }
	 
	
	}
	if(vtranCustType1 == "trdCus")
	{
	  var Tftran = document.forms[0].tranParticular.value.substring(0,1);
	  if(Tftran == "T")
	 { 
	   var lentranParticular = document.forms[0].tranParticular.value.length;				 
		if (lentranParticular > 50)
		 { 
		  document.forms[0].tranParticular.value = frm.tranParticular.value.substring(0,49)
		 }
	 
	  } else {
	    document.forms[0].tranParticular.value = "T" + document.forms[0].tranParticular.value;		
		var lentranParticular = document.forms[0].tranParticular.value.length;
				 
		if (lentranParticular > 50)
		{ 
		 document.forms[0].tranParticular.value = frm.tranParticular.value.substring(0,49)
	    }
	 
	 }
	}
	} //end if
	// ==================================================================


	var valueDateObj = eval("frm."+frm.valueDate.getAttribute("vFldId"))
	setFieldsAsMandatory();
	fnSetAttributeValue(frm.glDate,"fmnd","Y");
	fnSetAttributeValue(frm.valueDate,"fmnd","Y");
	fnSetAttributeValue(frm.refCrncy,"fmnd","Y");
	valueDateObj.setAttribute("fmnd","N");
	if (!fnValidateMandatoryFields()) {
			return false;
	}
	var isInTypeNull = fnIsNull(frm.instrType.value);
	var isInAlphaNull = fnIsNull(frm.instrAlpha.value);
	var isInNumNull = fnIsNull(frm.instrNum.value);
	var isInDateNull = fnIsNull(frm.instrDate.value);
	if ((!isInAlphaNull || !isInNumNull || !isInDateNull) && (isInTypeNull)) {
			alert(finbranchResArr.get("FAT000200"));
			frm.instrType.focus();
			return false;
	}
	if(frm.instrType.value == "CHQ"){
			if (isInNumNull) {
					alert(finbranchResArr.get("FAT000200"));
					frm.instrNum.focus();
					return false;
			}
	}
	if (!validateTypes(frm)) {
			return false;
	}
	if (getAmtInFloat(frm.refAmt.value) <= 0) {
			alert(finbranchResArr.get("FAT000405"));
			frm.refAmt.focus();
			return false;
	}
	if (isAcctValid == "true" && !fnIsNull(schmType)) {
		if((schmType != "CAA") && (schmType != "CCA") && (schmType != "OAB") &&
				(schmType != "ODA") && (schmType != "SBA") && (schmType != "TDA") &&
				(schmType != "OAP") && (schmType != "LAA") && (schmType != "CLA") &&
				(schmType != "DDA") && (schmType != "HOC") && (schmType != "TUA") &&
				(schmType != "PCA") &&(schmType != "FBA")) {
				alert(finbranchResArr.get("FAT000559") + " "+schmType + " "+ finbranchResArr.get("FAT000560"));
				frm.acctId.focus();
				return false;
		}
		else if (menuParam == "BTMMP" && schmType == "DDA") {
				/* DD issue/payment not allowed through this menu option */
				alert(finbranchResArr.get("FAT002132"));
				frm.acctId.focus();
				return false;
		}
	}
	if(!fnTMAdFwValidation()) {
			return false;
	}
	if(! validatePTranForChrg(isAcctValid, schmType, frm.acctId, frm.chrgEventId)){
			return false;
	}
	return true;
}





function validate()
{
	if(frm.acctId.value == ""){
	alert('enter the acct number');
	frm.refAmt.value = "";
	return false;
     }
    var amount  = fnRemoveCommas(frm.refAmt.value);
 if((funcCode == "A") && ( frm.refAmt.value != "") && (acctId != ""))
  {
   if((frm.acctCrncy.value != "NGN")  && ((document.forms[0].code.value == "R")  || (document.forms[0].code.value == "C"))) 
   {
    showdiv();
   }else{
   hidediv();
      if(((amount >= 1000000.00)  && (document.forms[0].code.value == "R")) || (( amount >= 5000000.00)  && (document.forms[0].code.value == "C")))
	{
        showdiv();
        }else{
    	hidediv();
   	}
    }
  }
     return 1;
}

//*************** Maximum Balance on Scheme Code 60004*******
function maxcredit()
{

 var acctno = document.forms[0].acctId.value;
	     var tranamt = document.forms[0].refAmt.value;
         var Ttype = document.forms[0].tranType.value;
         var Tstype = document.forms[0].tranSubType.value;
		 var currny = document.forms[0].refCrncy.value;
		 var partran = getRadioValue(document.forms[0].pTranType);
	     var inputNameValues ="foracid|"+acctno+"|transamt|"+tranamt+"|tranSubType|"+Tstype;
		 var scrName = "transAbove500T.scr";
         var outputNames ="availflg|maxAmt|schmdesc";
         retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);
	     var avg = document.forms[0].availflg.value;
		 var maxAmt2 = document.forms[0].maxAmt.value;
		 var schmcode2 = document.forms[0].schmdesc.value;		

			  result  = avg + "|" + maxAmt2 + "|" + schmcode2 + "|" + partran
			  return result;
}

function fnRemoveCommas(InpValue)
{
        sNew ="";
        sTemp = InpValue.split(",");
        for (i=0;i<sTemp.length;i++)
        {
                if (sTemp[i]!=null)
                sNew = sNew + sTemp[i];
        }
        return sNew;
}

function fnRemoveHiphen(InpValue)
{
        sNew ="";
        sTemp = InpValue.split("-");
        for (i=0;i<sTemp.length;i++)
        {
                if (sTemp[i]!=null)
                sNew = sNew + sTemp[i];
        }
        return sNew;
}

function hidediv() {
//alert('hide');
isNfiuFlg = "empty";
if (document.getElementById) { // DOM3 = IE5, NS6
document.getElementById('hideShow').style.visibility = 'hidden';
}
else {
if (document.layers) { // Netscape 4
document.hideShow.visibility = 'hidden';
}
else { // IE 4
document.all.hideShow.style.visibility = 'hidden';
}
}
}

function showdiv() {
//alert('show');
isNfiuFlg = "toBeFilled";
if (document.getElementById) { // DOM3 = IE5, NS6
document.getElementById('hideShow').style.visibility = 'visible';
}
else {
if (document.layers) { // Netscape 4
document.hideShow.visibility = 'visible';
}
else { // IE 4
document.all.hideShow.style.visibility = 'visible';
}
}
}


function tmdet_ONCHANGE7(obj,p1)
{
 // alert('amt '+frm.refAmt.value);
 

        var retVal = "";
        if (preEventCall('tmdet',obj,'ONCHANGE') == false) {
                return false;
        }
        if ((retVal = computeAmt(p1)) == false) {
                return false;
        }
        if (postEventCall('tmdet',obj,'ONCHANGE') == false) {
                return false;
        }
		
 //*******section to handle insufficient balance for cashlite charge *********
 
 var acct = document.forms[0].acctId.value;
var cnyt = document.forms[0].refCrncy.value;
 var amt = document.forms[0].refAmt.value;
 var type = document.forms[0].tranType.value;
 var stype = document.forms[0].tranSubType.value;
 var tdate = document.forms[0].valueDate.value;
 var soll = jsUtil.encodeChar(initSolId);
 
if ( (type == "C") & (stype == "NP") ) { 
		
       var inputNameValues ="acctNum|"+acct+"|tranAmt|"+amt+"|tranType|"+type+"|tranSubType|"+stype+"|tranDate|"+tdate+"|solId|"+soll+"|currencyT|"+cnyt;
       var scrName = "trancashlite.scr";
       var outputNames ="availFlag";
       retVal = appFnExecuteScript(inputNameValues, outputNames, scrName, true);	   
	   var avll = document.forms[0].availFlag.value;
	   if(avll =="N"){
			alert("Insufficient balance to take care of cashlite charges");
			document.forms[0].refAmt.focus();
			return false;
	   }

		
	}
 
 //***************************************************************************
		
		
        validate();
        return (retVal == undefined) ? true : retVal;
}


function tmdet_ONCHANGE4(obj)
{
//   alert('.....'+frm.acctId.value);

if(frm.refAmt.value != ""){
	frm.refAmt.value = "";
	return false;
     }

        var retVal = "";
        if (preEventCall('tmdet',obj,'ONCHANGE') == false) {
                return false;
        }
        if ((retVal = getAcctDetails()) == false) {
                return false;
        }
        if (postEventCall('tmdet',obj,'ONCHANGE') == false) {
                return false;
        }
        return (retVal == undefined) ? true : retVal;
}

function fnvalDate(Obj)
{
        var frm = document.forms[0];
        date=Obj.value;
        var dateflag=0;
        var dt=date;
        var day=dt.substring(0,2);
        var mon=dt.substring(3,5);
        var year=dt.substring(6,10);
        var slash1=dt.substring(2,3);
        var slash2=dt.substring(5,6);

        if(date == "")
        {
                return true;
        }
        if(slash1 != slash2)
        {       
                dateflag="1";
                Obj.focus();
                
        }

        if((slash1!="-" && slash1 != "." && slash1 != "/") ||
        (slash2!="-" && slash2 != "." && slash2 != "/") || dt.length<10)
        {
                dateflag="1";
                Obj.focus();
        }
        else if( (isNaN(day)) || (isNaN(mon)) || (isNaN(year)) )
        {
                dateflag="1";
                Obj.focus();
        }
        else if( (day<"01") || (day>"31") || (mon<"01") || (mon>"12"))
        {
                dateflag="1";
                Obj.focus();
        }
 else if((mon == "04") || (mon == "06") || (mon =="09") || (mon == "11"))
        {
                if(parseInt(day) > 30)
                {
                        dateflag="1";
                        Obj.focus();
                }
        }
        else if( (parseInt(year) % 4 == 0) && ( (parseInt(year) % 100 != 0) || (parseInt(year) % 400 == 0)))
        {
                if ((mon == "02" ) && (parseInt(day) > 29))
                {
                        dateflag="1";
                        Obj.focus();
                }
        }
      else if((mon == "02") && (parseInt(day) > 28 ))
        {
                dateflag="1";
                Obj.focus();
        }
        if(dateflag=="1")
        {
                Obj.value="";
                Obj.focus();
                alert("Invalid date");
                return false;
        }
	eraseCookie("issueDate");
       //alert(document.forms[0].issueDate_ui.value);
      document.forms[0].issueDate.value = document.forms[0].issueDate_ui.value;
	document.forms[0].sourceOfFund.value = "";      

        return true;
}

function fnvalDate2(Obj)
{

        var frm = document.forms[0];
        date=Obj.value;
        var dateflag=0;
        var dt=date;
        var day=dt.substring(0,2);
        var mon=dt.substring(3,5);
        var year=dt.substring(6,10);
        var slash1=dt.substring(2,3);
        var slash2=dt.substring(5,6);

        if(date == "")
        {
                return true;
        }
        if(slash1 != slash2)
        {       
                dateflag="1";
                Obj.focus();
                
        }

        if((slash1!="-" && slash1 != "." && slash1 != "/") ||
        (slash2!="-" && slash2 != "." && slash2 != "/") || dt.length<10)
        {
                dateflag="1";
                Obj.focus();
        }
        else if( (isNaN(day)) || (isNaN(mon)) || (isNaN(year)) )
        {
                dateflag="1";
                Obj.focus();
        }
        else if( (day<"01") || (day>"31") || (mon<"01") || (mon>"12"))
        {
                dateflag="1";
                Obj.focus();
        }
 else if((mon == "04") || (mon == "06") || (mon =="09") || (mon == "11"))
        {
                if(parseInt(day) > 30)
                {
                        dateflag="1";
                        Obj.focus();
                }
        }
        else if( (parseInt(year) % 4 == 0) && ( (parseInt(year) % 100 != 0) || (parseInt(year) % 400 == 0)))
        {
                if ((mon == "02" ) && (parseInt(day) > 29))
                {
                        dateflag="1";
                        Obj.focus();
                }
        }
      else if((mon == "02") && (parseInt(day) > 28 ))
        {
                dateflag="1";
                Obj.focus();
        }
        if(dateflag=="1")
        {
                Obj.value="";
                Obj.focus();
                alert("Invalid date");
                return false;
        }
    eraseCookie("expiryDate");
	//alert(document.forms[0].expiryDate_ui.value);
      document.forms[0].expiryDate.value = document.forms[0].expiryDate_ui.value;
	document.forms[0].sourceOfFund.value = "";
        return true;
  
}


function tmdet_ONCLICK23(obj,p1)
{
	      eraseCookie("cifId1");
              eraseCookie("acctNum1"); 
              eraseCookie("chrgAmt1");
              eraseCookie("chrgbAmt1"); 
              eraseCookie("chrgVat1"); 
              eraseCookie("tranSubType1"); 
              eraseCookie("type1"); 
              eraseCookie("currencyT1"); 
              eraseCookie("tranCustType1");
              eraseCookie("maa1");

   var type = frm.tranType.value;
    var stype = frm.tranSubType.value;                

   if((funcCode == "A"  || funcCode == "P" || (funcCode == "M"  && frm.tranParticularsCode.checked == false)) && type  == "C" ){

         sssave1();
    }

	var retVal = "";
	if (preEventCall('tmdet',obj,'ONCLICK') == false) { 
		return false;
	}
	if ((retVal = fnOnButtonClick(p1)) == false) {
		return false;
	}
	if (postEventCall('tmdet',obj,'ONCLICK') == false) { 
		return false;
	}
	return (retVal == undefined) ? true : retVal;
}




 function checkCustomer(c)
 {
  if(c == 'Y' ){
   document.forms[0].acctNum.disabled=false;
	document.getElementById("partyTypeYes").value = "Y";
	createCookie("partyType","Y",0);
	document.forms[0].acctNum.focus();
	document.forms[0].acctNum.value="";
    }else{
	eraseCookie("partyType");
	document.getElementById("partyTypeNo").value ="N";
     document.forms[0].acctNum.value =" ";
      document.forms[0].acctNum.disabled=true;
    
                document.forms[0].address.value="";
                document.forms[0].phoneNumber.value="";
                document.forms[0].particulars.value="";
                document.forms[0].idNumber.value="";
                document.forms[0].issueDate.value="";
                document.forms[0].expiryDate.value="";
                document.forms[0].sourceOfFund.value="";
		document.forms[0].issueDate_ui.value="";
               document.forms[0].expiryDate_ui.value="";
	document.forms[0].surname.focus();
	document.forms[0].surname.value="";
	document.forms[0].firstname.value="";
	document.forms[0].middlename.value="";
		eraseCookie("acctNum");
         eraseCookie("surname");
	  eraseCookie("firstname");
	 eraseCookie("middlename");
         eraseCookie("address");
         eraseCookie("phoneNumber");
 	eraseCookie("particulars");
 	eraseCookie("issueDate");
 	eraseCookie("expiryDate");
 	eraseCookie("idNumber");
 	eraseCookie("source");
  	eraseCookie("tranDate");

    }
 }


</script> 
  </head>


<TABLE class="ctable">
<tr>
<td colspan ="4" class="coption">&nbsp;<strong>Please select the customer type</strong>&nbsp;</td></tr>
<tr>
<td align="left">
<input type="radio" class="radio" id="tranCustType" name="tranCustType" value="trdCus" >Third Party Customer

<td >
<input type="radio" class="radio" id="tranCustType" name="tranCustType" value="ahdCus" >Account Holder Customer
</td>
<td >
</td>
</tr>
</table>

<TABLE class="ctable">
<tr>
<td colspan ="4" class="coption">&nbsp;<strong>Please click the button to generate narration for HXFER</strong>&nbsp;</td></tr>
<tr>
<td align="left">
<input type="button" class="radio" id="tranHxfer" name="tranHxfer"  value="Narration" onclick="dohxfernarration()">Generate Narration
<td >
</td>
</tr>
</table>




<div id="hideShow">
<table width="89%" height = "77%" border="0" cellspacing="0" cellpadding="0" class="ctable">
<tr><td  align="right">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableborder" align="right">
<tr><td  align="right">

  <table width="100%" height = "77%" border="0" cellspacing="0" cellpadding="0" class="innertable">

<tr>
<td class="textlabel" width="5%" >Customer</td>

        <td class="textlabel" width="65%" >YES:
       <input id="partyTypeYes" name="partyType"  type="radio" value="Y" title="Customer type"  onClick="checkCustomer('Y');">NO:
       <input id="partyTypeNo" name="partyType"  type="radio" value="N" title="Customer type"  onClick="checkCustomer('N');">


        </td>
        <td class="textlabel" >Acct. ID</td>

        <td class="textlabel"  align="left" width="20%">
         
	<input name="acctNum" id="acctNum" hotKeyId ="search1A" type="text" class="textfieldfont" size="25" maxlength="16"   onChange="fnChange(document.forms[0].acctNum.value);">
        <!--a href="javascript:showAccountIdList(document.forms[0].acctNum);" id="sLnk2" -->
         <a href="javascript:fnAccountList(document.forms[0].acctNum);" id="sLnk2" >
        <img hotKeyId="search1A" src="../Renderer/images/INFENG/search_icon.gif" width="16" height="17" border="0"></a>
         
	</td>
        </tr>



       <tr>
        <td class="textlabel">Surname <script>setMandatory("Y");</script></td>
        <td class="textlabel"  ><input type="text" id="surname" name = "surname" size="30" maxlength="80"  onChange="chngSurnname(this);" >
        </td><td>&nbsp;</td>
        </tr>

        <tr>
        <td class="textlabel" width="5%" >Firstname <script>setMandatory("Y");</script></td>

        <td class="textlabel" width="65%" ><input type="text" size="30" id="firstname" name = "firstname" maxlength="80" onChange="chngFirstname(this);">
        </td>
        <td class="textlabel" >Middlename <script>setMandatory("Y");</script></td>

        <td class="textlabel"  align="left" width="20%"><input type="text" size="30" id="middlename" name = "middlename" maxlength="15"  align="left"  onChange="chngMiddlename(this);" 
        </td>
        </tr>

 	 
        <tr>
        <td class="textlabel" width="5%" >Phone Number <script>setMandatory("Y");</script></td>

        <td class="textlabel" width="65%" ><input type="text" size="30" id="phoneNumber" name = "phoneNumber" maxlength="80" onChange="chngPhoneNumber(this);">
        </td>
        <td class="textlabel" >Address <script>setMandatory("Y");</script></td>

        <td class="textlabel"  align="left" width="20%"><input type="text" size="30" id="address" name = "address" maxlength="15"  align="left"  onChange="chngAddress(this);" 
        </td>
        </tr>


        <tr>
        <td class="textlabel">ID Type <script>setMandatory("Y");</script></td>

        <td class="textlabel" align="left">
        <!--input type="text" id="particulars" name = "particulars"-->
        <SELECT name="particulars"  id="particulars" class="textfieldfont" width="10"  onChange="chngParticulars(this);">
        <OPTION selected value="">--- Select an option ---</OPTION>
        <OPTION  value="DRIVERS LICENSE">DRIVERS LICENSE</OPTION>
        <OPTION value="NATIONAL ID">NATIONAL ID</OPTION>
        <OPTION value="INTERNATIONAL PASSPORT">INTL PASSPORT</OPTION>
        </SELECT>
        </td>

        <td class="textlabel">Issue Date <script>setMandatory("Y");</script></td>



<input type="hidden" id="issueDate"   vFldId="issueDate_ui" name="issueDate">
<td class="textlabel">
  <input size="30" id="issueDate_ui" maxlength="10" onChange="fnvalDate(document.forms[0].issueDate_ui);" name="issueDate_ui" hotKeyId="calenderK" mnebl="false" fmb="N" fdt="uidate" fblk="defaultFblk2" > 
   <a id="sLnkK" href="javascript:openDate(document.forms[0].issueDate_ui,BODDate)">
      <img id="daysOfMonth1Pos" width="24" height="19" src="../Renderer/images/INFENG/calender.gif" align="absmiddle" border="0" style="cursor:hand" alt="Select date from calendar" class="img" hotKeyId="calenderK"></a>
        </td>
        </tr>

        <tr>
        <td  class="textlabel2">Expiry Date <script>setMandatory("Y");</script></td>

<td class="textlabel">
     <input type="hidden" id="expiryDate"    mneb1="N" vFldId="expiryDate_ui" name="expiryDate" onChange="fnvalDate(document.forms[0].expiryDate);">
  <input size="30" onBlur="javascript:return custom_ONBLUR(tmdet,this);" maxlength="10" onChange="fnvalDate2(document.forms[0].expiryDate_ui);" id="expiryDate_ui" name="expiryDate_ui" hotKeyId="calenderK2" mnebl="false" fmb="N" fdt="uidate" fblk="defaultFblk2" >
   <a id="sLnkK2" href="javascript:openDate(document.forms[0].expiryDate_ui,BODDate)">
   <img id="daysOfMonth1Pos" width="24" height="19" src="../Renderer/images/INFENG/calender.gif" align="absmiddle" border="0" style="cursor:hand" alt="Select date from calendar" class="img" hotKeyId="calenderK2"></a>
 </td>
 

        <td class="textlabel">ID Number <script>setMandatory("Y");</script></td>

        <td class="textlabel"><input type="text" size="30" id="idNumber" name =  "idNumber" maxlength="30"  onChange="chngIdNumber(this);">
       </td>
        </tr>
    <input type="hidden" id="cardsuccessOrFailure" name = "cardsuccessOrFailure">
	<input type="hidden" id="MSGALERTsuccessOrFailure" name = "MSGALERTsuccessOrFailure">
	<input type="hidden" id="MSGALERT" name = "MSGALERT">
	<input type="hidden" id="flagout" name = "flagout">
	<input type="hidden" id="domout" name = "domout">
	<input type="hidden" id="MomentDesc" name = "MomentDesc">
	<input type="hidden" id="MomentAlertFlg" name = "MomentAlertFlg">	<input type="hidden" id="sign" name = "sign">
	<input type="hidden" id="_details1" name = "_details1">
	<input type="hidden" id="_details2" name = "_details2">
	<input type="hidden" id="type" name = "type">
	<input type="hidden" id="radValue" name = "radValue">
	<input type="hidden" id="display" name = "display">
	<input type="hidden" id="availFlg" name = "availFlg">
	<input type="hidden" id="availFlag" name = "availFlag">
	<input type="hidden" id="availflg" name = "availflg">
	<input type="hidden" id="fixedamt" name = "fixedamt">
	<input type="hidden" id="maxAmt" name = "maxAmt">
	<input type="hidden" id="chkfunc" name = "chkfunc">
	<input type="hidden" id="chkfuncA" name = "chkfuncA">
	<input type="hidden" id="schmdesc" name = "schmdesc">
	<input type="hidden" id="vatoffacct" name = "vatoffacct">
	<input type="hidden" id="vatchgamt" name = "vatchgamt">
	<input type="hidden" id="transnarr" name = "transnarr">
	<input type="hidden" id="offAcct" name = "offAcct">
	<input type="hidden" id="chrgAmt2" name = "chrgAmt2">
	<input type="hidden" id="chrgflg" name = "chrgflg">
 	<input type="hidden" id="_surname" name = "_surname">
	<input type="hidden" id="_firstname" name = "_firstname">
	<input type="hidden" id="_middlename" name = "_middlename">
         <input type="hidden" id="_address" name = "_address">
	<input type="hidden" id="_phoneNumber" name = "_phoneNumber">
    	<input type="hidden" id="_particulars" name = "_particulars">
         <input type="hidden" id="_idNumber" name = "_idNumber">
	<input type="hidden" id="_issueDate" name = "_issueDate">
    	<input type="hidden" id="_expiryDate" name = "_expiryDate">
         <input type="hidden" id="_tranDate" name = "_tranDate">
	<input type="hidden" id="_source" name = "_source">
        <input type="hidden" id="chrgAmt"   vFldId="chrgAmt_ui" name="chrgAmt">
        <input type="hidden" id="cifId"   vFldId="cifId_ui" name="cifId">
        <input type="hidden" id="chrgbAmt"   vFldId="chrgbAmt_ui" name="chrgbAmt">
        <input type="hidden" id="chrgVat"   vFldId="chrgVat_ui" name="chrgVat">
        <input type="hidden" id="totAmt"   vFldId="totAmt_ui" name="totAmt">
        <input type="hidden" id="tpchk"   vFldId="tpchk_ui" name="tpchk">

        <input type="hidden" id="code" name = "code">
         <input type="hidden" id="ptype" name = "ptype">
	<input type="hidden" id="ptypedesc" name = "ptypedesc">
	 <input size="30" type="hidden"   id="withrawernameValue" name = "withrawernameValue">
	<input size="30" type="hidden"   id="schmTypeValue" name = "schmTypeValue">
	<input size="30" type="hidden"   id="acctOwnerShipValue" name = "acctOwnerShipValue">	
	<input size="30" type="hidden"   id="HxferNarration" name = "HxferNarration">
         <tr>
        <td  class="textlabel2">Source Of Fund <script>setMandatory("Y");</script></td>

        <td class="textlabel"><input type="text" size="30" id="sourceOfFund" name = "sourceOfFund" maxlength="100"  onChange="chngSource(this);">
        </td>
        <td class="textlabel">  </td>

        <td class="textlabel"><input size="30" type="hidden"   id="tranDate" name = "tranDate">
        </td>
        </tr>
         </table>
         </td> </tr>
        </table>
        </td> </tr>
       </table>
 </div>

</html>
