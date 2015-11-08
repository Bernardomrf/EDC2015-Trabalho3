<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="properties">
    <owners>
      <xsl:for-each select="//owner">
        <owner>
          <xsl:attribute name="tax_number">
            <xsl:value-of select="@tax_number"/>
          </xsl:attribute>
          <xsl:attribute name="name">
            <xsl:value-of select="@name"/>
          </xsl:attribute>
          <xsl:attribute name="purchase_date">
            <xsl:value-of select="@purchase_date"/>
          </xsl:attribute>
          <xsl:attribute name="sale_date">
            <xsl:value-of select="@sale_date"/>
          </xsl:attribute>
          <xsl:attribute name="land_register">
            <xsl:value-of select="../../land_register"/>
          </xsl:attribute>
        </owner>
      </xsl:for-each>
    </owners>
  </xsl:template>



</xsl:stylesheet>