<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>무비리뷰에 오신 여러분을 환영합니다.</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
	
	
</head>

<body>
	<div id="wrap">

		<%-- header area --%>
		<jsp:include page="../include/header.jsp" />

  		<h1 id="community"><div>community</div></h1>
		
		<article>
			<h2>포토갤러리 업로드 </h2>
			<form id="upphoto" action="photo_upload_process.jsp" method="post" enctype="multipart/form-data">
				<div id="photoframe"> 
					<img id="imgBG" src="../upload_community" class="photoplace">
				</div>
				<p><input type="file" id="filename" name="filename"></p> 
				<p><label>제목</label><input type="text" name="subject"></p>
			    <input type="submit" value="전송 하기 ">
			</form>	
  		</article>
		
		
  		<%-- sidebar_community.jsp include --%>
  		<jsp:include page="../include/sidebar_community.jsp"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"> 
	var dropbox = document.getElementById('imgBG'); 

// 	dropbox.ondragover = function (event) {}
// 	dropbox.ondrop = function (event) {}
	
	// Setup drag and drop handlers. 
	//dropbox.addEventListener('dragenter', stopDefault, false); 
	dropbox.addEventListener('dragover', stopDefault, false); 
	//dropbox.addEventListener('dragleave', stopDefault, false); 
	dropbox.addEventListener('drop', onDrop, false); 

	function stopDefault(e) { 
		e.stopPropagation(); 
		e.preventDefault(); 
	} 
	
	function onDrop(e) { 
		e.stopPropagation(); 
		e.preventDefault(); 
		
		var readFileSize = 0; 
		var files = e.dataTransfer.files; // 드롭한 파일리스트
		
		
		//$('#imgFile').prop('files', files);
		var fileElem = document.getElementById('filename');
		fileElem.files = files; // 파일리스트를 파일요소에 설정
		
	
		file = files[0]; 
		readFileSize += file.size;
		console.log(file.size + 'bytes');
	
		// Only process image files. 
		var imageType = /image.*/; 

		if (!file.type.match(imageType)) { 
			return; 
		} 
		
		var reader = new FileReader(); 
	
		reader.onerror = function(e) { 
			alert('Error code: ' + e.target.error); 
		}; 

		reader.onload = function (evt) {
			// evt.target 은 FileReader
			console.log(evt.target);
			console.log(evt.target.result);
			dropbox.src = evt.target.result;
		}

		// Read in the image file as a data url. 
		reader.readAsDataURL(file); 
	} 
</script>


        <div class="clear"></div>
        <%-- footer area --%>
		<jsp:include page="../include/footer.jsp" />
</div>


       <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function() {
			$(".fancybox").fancybox({
				openEffect	: 'none',
				closeEffect	: 'none'
			});
		});
  	</script>
</body>
</html>
