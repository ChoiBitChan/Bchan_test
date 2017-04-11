<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset=utf-8>
<title>HTML5 Demo: File API (simple)</title>

	<script type="text/javascript">
		
		function imageViewer(id, viewer) {
			
			var upload = document.getElementById(id)
			var viewDiv = document.getElementById(viewer)
			
			upload.onchange = function(e) {
				e.preventDefault();
				
				var file = upload.files[0], reader = new FileReader();
				reader.onload = function(event) {
					var img = new Image();
					img.src = event.target.result;
					img.width = 300;
					viewDiv.innerHTML = '';
					viewDiv.appendChild(img);
				};
				reader.readAsDataURL(file);

				return false;
			};
			
		}
	
	</script>

</head>
<body>

		<input type=file id="main_image" onclick="imageViewer('main_image','main_view')">
		<div id="main_view"></div>
		<input type=file id="detail_image" onclick="imageViewer('detail_image','detail_view')">
		<div id="detail_view"></div>
		<input type=file id="menu_image" onclick="imageViewer('menu_image','menu_view')">
		<div id="menu_view"></div>
		
</body>
</html>