<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    version="2.0">
    
    <xsl:variable name="datao-fbid-elements" select="tokenize($DATA_OFBID_ELEMENTS, '\s*,\s*')"/>

    <!--
        WH-2505 - Override the template from 'plugins/org.dita.html5/xsl/topic.xsl' to generate 'data-ofbid' attribute.    
    -->
    <xsl:template name="setidaname">
        <xsl:if test="@id">
            <!-- Oxygen start path -->
            <!-- Replaced the setidattr template with setid. The setid template always calls setidattr template and
            additinally it checks if the data-ofbid should be added or not. -->
            <xsl:call-template name="setid"/>
            <!-- Oxygen end path -->
            <xsl:call-template name="setanametag">
                <xsl:with-param name="idvalue" select="@id"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!--
        WH-2505 - Override the template from 'plugins/org.dita.html5/xsl/topic.xsl' to generate 'data-ofbid' attribute.    
    -->
    <xsl:template name="setid">
        <xsl:if test="@id">
            <xsl:call-template name="setidattr">
                <xsl:with-param name="idvalue" select="@id"/>
            </xsl:call-template>
                        
            <!-- Oxygen start path -->
            <xsl:variable name="currentElementClass" select="tokenize(@class, '\s+')"/>
                        
            <xsl:if test="$currentElementClass = $datao-fbid-elements">
                <xsl:call-template name="setdataofbid">
                    <xsl:with-param name="idvalue" select="@id"/>
                </xsl:call-template>
            </xsl:if>
            <!-- Oxygen end path -->
        </xsl:if>
    </xsl:template>
    
    <!-- Generated data-ofbid attribute -->
    <xsl:template name="setdataofbid">
        <xsl:param name="idvalue"/>
        <xsl:attribute name="data-ofbid"
            select="dita-ot:get-prefixed-id($idvalue/parent::*, $idvalue)"/>
    </xsl:template>
</xsl:stylesheet>