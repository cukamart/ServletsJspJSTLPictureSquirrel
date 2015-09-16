<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!-- Importujem header.jsp a cez param poslem hodnotu title... -->
<c:import url="header.jsp">
	<c:param name="title" value="Picture Squirrel Home"></c:param>
</c:import>



<!-- Nastavi databazu ku ktorej sa pripajam (dalej sa budem odkazovat cez to co je vo var teda 'ds' -->
<sql:setDataSource var="ds" dataSource="jdbc/picturesquirrel" />




<!-- SQL Query nastavit databazu, napisat query, ulozit do premennej var -->
<sql:query dataSource="${ds}" sql="select * from images" var="results" />



<!-- HTML tag pre tabulku nacita z css images style (zarovna obrazky na sted) -->
<table class="images">

	<!-- moja lokalna premmenna ako keby spravim int tableWidth = 8 -->
	<c:set var="tableWidth" value="8" />

	<!-- cez forEarch prejst query (nazov query pisem do items do var ide obycajna premmnenna pre for earch loop cez varStatus dostanem index -->
	<c:forEach var="image" items="${results.rows}" varStatus="status">

		<!-- ak je 0 8 16 24 obrazok atd... tak sprav <tr> tag (zaciatok riadku v tabulke) index je iteracia tableWidth je moja premenna -->
		<c:if test="${status.index % tableWidth eq 0}">
			<tr>
		</c:if>

		<p>
			<!-- premennu imgName nastavi na konkretny obrazok ten potom vo for-each prebehnem a zobrazim... -->
			<c:set scope="page" var="imgName"
				value="/${image.stem}.${image.image_extension}"></c:set>

			<!-- relativna cesta k obrazkom /pic/konkretny obrazok co vratila databaza width je nepovinny parameter scaluje obarazky... -->
		<td>
			<!-- ahref cez url dostane odkaz a obaluje samotny image ktory je vdaka tomu klikatelny -->
			<!-- c url automaticky riesi relativnu cestu aj problemy s cookies :) -->
			<!-- za otaznikom predavam 2 parametre... prvy action podla toho sa v controlleri rozhodujem aku stranku dalej spustim druhy je image tam dynamicky nastavujem ID a potom na danej stranke to ID image ziskam a zobrazim na zaklade neho -->
			<a href="<c:url value="/Controller?action=image&image=${image.id}"/>">
				<img width="160px" src="${pageContext.request.contextPath}/pic/${imgName}" /></a>
		</td>
		</p>

		<!-- za kazdym 7dmym obrazkom sprav ukoncenie riadku tabulky (mozem brat ako newline pre pisany text...) -->
		<c:if test="${(status.index + 1) % tableWidth eq 0}">
			</tr>
		</c:if>

	</c:forEach>

</table>

<c:import url="footer.jsp"></c:import>