<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="properties">
    <properties>
      <xsl:for-each select="property">
        <xsl:sort select="address/city"/>
        <property>
          <xsl:for-each select="address">
            <xsl:attribute name="city">
              <xsl:value-of select="city"/>
            </xsl:attribute>
          </xsl:for-each>
       </property>
      </xsl:for-each>
    </properties>
  </xsl:template>



</xsl:stylesheet>
