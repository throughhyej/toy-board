<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
</head>
<body class="is-preload">
	<!-- Sidebar -->
	<div id="sidebar">
		<div class="inner">
			<!-- Search -->
			<section id="search" class="alt">
				<form method="post" action="#">
					<input type="text" name="query" id="query" placeholder="Search" />
				</form>
			</section>
			<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>Menu</h2>
				</header>
				<ul>
					<li><a href="index.html">Homepage</a></li>
					<li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li>
					<li>
						<span class="opener">Submenu</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul>
					</li>
					<li><a href="#">Etiam Dolore</a></li>
					<li><a href="#">Adipiscing</a></li>
					<li>
						<span class="opener">Another Submenu</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul>
					</li>
					<li><a href="#">Maximus Erat</a></li>
					<li><a href="#">Sapien Mauris</a></li>
					<li><a href="#">Amet Lacinia</a></li>
				</ul>
			</nav>
		</div>
	</div>
<!-- <script src="resources/base.js"></script> -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/browser.min.js"></script>
<script src="resources/js/breakpoints.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
</body>
</html>