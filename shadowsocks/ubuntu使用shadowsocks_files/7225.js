(function(){
    var adid = Math.random().toString(36).substr(2, 8);
    document.writeln("<div id='"+adid+"'></div>");
    var domain = "//bbds.zgrsq.cn";
    var mj_uid=70225;
    var mj_tid = 75;
    document.writeln("<script src=\"" + domain + "/nc/ni.ashx?" + mj_uid + "_1_" + mj_tid + "_0_0_" + 640 + "_" + 100 + "_0_200_"+adid+"\"><\/script>\r\n");
})();
document.writeln("<div style=\"display:none\"><script src=\"https://s96.cnzz.com/z_stat.php?id=1276812595&web_id=1276812595\" language=\"JavaScript\"><\/script><\/div>\r\n")