<?xml version="1.0" encoding="ISO-8859-1"?>

<!--
print <logentry>s with <path kind="dir">...</path>

information to print:
- revision
- logmsg
- which dirs where touched
- how they were touched (added, deleted, copied,...)
-->


<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="msg"/>

  <xsl:template match="logentry[paths/path/@kind='dir']">
    <xsl:element name="logentry"><xsl:attribute name="revision"><xsl:value-of select='@revision'/></xsl:attribute><xsl:apply-templates/></xsl:element>
  </xsl:template>

  <xsl:template match="path[@kind='dir']">
    <xsl:element name="path">
      <xsl:attribute name="action"><xsl:value-of select='@action'/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>

  </xsl:template>

  <!-- ignore non-matching elements -->
  <xsl:template match="logentry|path"/>

  <!-- pass the rest elements -->
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>


</xsl:stylesheet>
