// window.indeedJobroll=function(){
//   var i=false;
//   return{
//     getJobs:function(g){
//       var a=window,f=function(b){
//         var c=String(document.cookie),d=c.indexOf(b+"=");
//         if(d==-1)return"";
//         var h=c.indexOf(";",d),e=c.indexOf(":",d);b=c.substring(d+b.length+1,h==-1?e==-1?c.length:e:e==-1?h:e<h?e:h);
//         c=b.indexOf('"')==0?1:0;
//         d=b.charAt(b.length-1)=='"'?b.length-1:b.length;
//         return b.substring(c,d)
//       }
//       ("IND_RQ"),j=document.createElement("script"),k=document.getElementsByTagName("head")[0];
//       j.async=true;j.src=ind_d+"/ads/jwidget.js?pub="+escape(ind_pub)+(a.ind_chnl?"&chnl="+ind_chnl:"")+"&el="+escape(ind_el)+(a.ind_pf?"&pf="+ind_pf:"")+(ind_q?"&q="+escape(ind_q):"")+(a.ind_l?"&l="+escape(ind_l):"")+(a.ind_n?"&n="+ind_n:"")+(f?"&lq="+escape(f):"")+"&lm="+(a.ind_t?ind_t:"")+"+"+(a.ind_c?ind_c:"")+(a.ind_nr||i?"&rtgt=0":"")+(g?"&s="+g:"&s=0")+(a.ind_pgn?"&pgn="+a.ind_pgn:"")+(a.ind_pgnCnt?"&pgnCnt="+a.ind_pgnCnt:"")+(a.ind_age?"&age="+a.ind_age:"")+(a.ind_snp?"&snp="+a.ind_snp:"")+(a.ind_iaTxt?"&iaTxt="+a.ind_iaTxt:"")+"&v=3";
//       k.appendChild(j);
//     return false
//     },
//     jobsCallback:function(g,a){
//       var f=document.getElementById(g);
//       if(f)if(a.indexOf('class="job"')===-1&&i===false){
//         i=true;window.indeedJobroll.getJobs(0)}else f.innerHTML=a
//       }
//     }
//   }();
//   window.indeedJobroll.getJobs(0);
