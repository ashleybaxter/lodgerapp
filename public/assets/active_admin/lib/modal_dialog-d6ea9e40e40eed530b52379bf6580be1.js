(function(){ActiveAdmin.modal_dialog=function(e,t,i){var o,r,a,n,l,d,c,s,p,u,f,g;n='<form id="dialog_confirm" title="'+e+'"><ul>';for(d in t){if(u=t[d],/^(datepicker|checkbox|text)$/.test(u))g="input";else if("textarea"===u)g="textarea";else{if(!$.isArray(u))throw new Error("Unsupported input type: {"+d+": "+u+"}");s=["select","option",u,""],g=s[0],r=s[1],c=s[2],u=s[3]}l="datepicker"===u?u:"",n+="<li>\n<label>"+(d.charAt(0).toUpperCase()+d.slice(1))+"</label>\n<"+g+' name="'+d+'" class="'+l+'" type="'+u+'">'+(c?function(){var e,t,i;for(i=[],e=0,t=c.length;t>e;e++)f=c[e],o=$("<"+r+"/>"),$.isArray(f)?o.text(f[0]).val(f[1]):o.text(f),i.push(o.wrap("<div>").parent().html());return i}().join(""):"")+("</"+g+">")+"</li>",p=[],g=p[0],r=p[1],c=p[2],u=p[3],l=p[4]}return n+="</ul></form>",a=$(n).appendTo("body"),$("body").trigger("modal_dialog:before_open",[a]),a.dialog({modal:!0,open:function(){return $("body").trigger("modal_dialog:after_open",[a])},dialogClass:"active_admin_dialog",buttons:{OK:function(){return i($(this).serializeObject()),$(this).dialog("close")},Cancel:function(){return $(this).dialog("close").remove()}}})}}).call(this);