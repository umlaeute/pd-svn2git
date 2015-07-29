<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:dc="http://purl.org/dc/elements/1.1/"
>

  <xsl:output method="text"/>
  
  <xsl:template match="/">
    <xsl:for-each select="/rss/channel/item/dc:creator">
      <xsl:apply-templates/><xsl:text>&#xa;</xsl:text></xsl:for-each>
  </xsl:template>

  <!-- ignore all the rest -->
  <xsl:template match="*"></xsl:template>

</xsl:stylesheet>
