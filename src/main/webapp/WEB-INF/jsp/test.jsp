<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@echocen_andrew" />
<meta name="twitter:title" content="Simple, Economical Client Documents" />
<meta name="twitter:description"
	content="A web service for generating & publishing professional emails, PDFs, DOCXs, etc by merging templates & data. Manage your company's outgoing mail with ease." />
<meta name="twitter:image"
	content="http://www.echopublish.com/img/paper-plane.png" />
<title>首 页</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap-combined.no-icons.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <!-- bootstrap.min.css -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- easyform.css -->
	<link rel="stylesheet" href="css/easyform.css">
    <!-- freelancer.min.css -->
    <link href="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/css/freelancer.min.css" rel="stylesheet">
    <!-- fileinput.min.css -->
    <link href="css/fileinput.min.css" rel="stylesheet" type="text/css">
    
	<link rel="stylesheet" type="text/css" href="css/test.css">

	<!-- jquery.min.js -->
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <!-- bootstrap.min.js -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-wysiwyg.js"></script>
    <script type="text/javascript" src="js/jquery.hotkeys.js"></script>
    <!--引入 easyform.js-->
	<script type="text/javascript" src="js/easyform.js"></script>
    <!-- freelancer.min.js -->
    <script src="https://cdn.bootcss.com/startbootstrap-freelancer/3.3.7/js/freelancer.min.js"></script>
    <!-- fileinput.min.js -->
    <script src="js/fileinput.min.js"></script>
	<script type="text/javascript" src="js/test.js"></script>
</head>
<body>
<div class="container">
  <div class="hero-unit">
	<!-- <hr/> -->
	<div id="alerts"></div>
    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
    
      <div class="btn-group">
      	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font">
        	<i class="icon-font"></i>&nbsp;<b class="caret"></b>
        </a>
        <ul class="dropdown-menu"></ul>
      </div>
      
      <div class="btn-group">
      	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size">
        	<i class="icon-text-height"></i>&nbsp;<b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
        	<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
          	<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
          	<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
        </ul>
      </div>
      
      <div class="btn-group">
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
      </div>
      <div class="btn-group">
      	<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
      		<div class="dropdown-menu input-append">
      			<input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
			    <button class="btn" type="button">Add</button>
        	</div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
      </div>
      
      <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="picture-Btn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#picture-Btn" data-edit="insertImage" />
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
      </div>
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    </div>

    <div id="editor">
      	输入内容&hellip;
    </div>
  </div>
 </div>
<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings(); 
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
  });
</script>
</body>
</html>