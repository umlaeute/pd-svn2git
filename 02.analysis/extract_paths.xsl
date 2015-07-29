<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>
  
  <xsl:template match="/">
    <xsl:for-each select="/log/logentry/paths/path[@kind='dir']">
      <xsl:element name="path">
	<xsl:apply-templates/>.
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <!-- ignore all the rest -->
  <xsl:template match="*"></xsl:template>

</xsl:stylesheet>
