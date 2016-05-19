<?xml version="1.0" encoding="UTF-8"?>
<!-- 
  Purpose:
    Returns productname of 

  Author(s):  Thomas Schraitle <toms@opensuse.org>

  Copyright:  2016 Thomas Schraitle

-->
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:d="http://docbook.org/ns/docbook">

 <xsl:output method="text"/>

 <xsl:template match="text()"/>

 <xsl:template match="/">
  <xsl:variable name="db5.book" select="d:book/d:info/d:productname[1]"/>
  <xsl:variable name="db5.article" select="d:article/d:info/d:productname[1]"/>
  <xsl:variable name="db5" select="($db5.book | $db5.article)[1]"/>
  <xsl:variable name="db4.book" select="book/bookinfo/productname[1]"/>
  <xsl:variable name="db4.article" select="article/articleinfo/productname[1]"/>
  <xsl:variable name="db4" select="($db4.book | $db4.article)[1]"/>

  <xsl:choose>
   <xsl:when test="$db5"><xsl:value-of select="normalize-space($db5)"/></xsl:when>
   <xsl:when test="$db4"><xsl:value-of select="normalize-space($db4)"/></xsl:when>
   <xsl:otherwise><xsl:message>ERROR: No productname found!</xsl:message></xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
