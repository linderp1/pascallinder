function asRep_nav(){
 if(navigator.appName.toLowerCase()=="microsoft internet explorer"&&typeof(window.onbeforeunload)!='undefined')return 'msie';
 if(navigator.userAgent.search(/gecko/i)>=0)return 'gecko';
 return 'other';
}
function asRep_testLateJS(){try{
 var si=document.createElement('script');
 si.language="javascript";si.type="text/javascript";si.text="var asRep_lateJS=1;";
 document.getElementsByTagName('head')[0].appendChild(si);
}catch(e){};}
var asRep_workWind=window;
if(!asRep_workWind.asRep_wasHere){
 asRep_workWind.asRep_wasHere=true;
 var asRep_serverURL="http://www.governmentsecurity.org/adreport/record.php";
 var asRep_ViewTime=(new Date()).getTime();
 asRep_testLateJS();
 document.write("<"+"sc"+"ript language='javascript' type='text/javascript' src='"+
  asRep_serverURL+"?rep=code&nav="+asRep_nav()+"&scope=page&tmp="+asRep_ViewTime+"'></"+"scr"+"ipt>");
}
