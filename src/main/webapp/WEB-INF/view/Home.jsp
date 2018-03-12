<%@include file="/WEB-INF/view/Header.jsp" %>
<div id="demo" class="carousel slide" data-ride="carousel" data-interval="2000">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<c:url value="/Resources/front1.JPG/"></c:url>" alt="Los Angeles" width="100%" >
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/Resources/front2.JPG/"></c:url>" alt="Chicago" width="100%" >
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/Resources/front3.JPG/"></c:url>" alt="New York" width="100%" >
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<div id="demo" class="carousel slide" data-ride="carousel" data-interval="2500">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<c:url value="/Resources/down1.JPG/"></c:url>" alt="Los Angeles" width="100%" >
    </div>
    <div class="carousel-item">
      <img src="<c:url value="/Resources/down2.JPG/"></c:url>" alt="Chicago" width="100%" >
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<%@include file="/WEB-INF/view/Footer.jsp" %>
