<?xml version="1.0" encoding="UTF-8"?>
<!--
    
Oxygen Webhelp Plugin
Copyright (c) 1998-2020 Syncro Soft SRL, Romania.  All rights reserved.

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs oxygen"
    xmlns:oxygen="http://www.oxygenxml.com/functions"
    version="2.0">
    
    <xsl:template name="generateWebhelpFooter">
        <xsl:if
            test="
            ('yes' = $WEBHELP_FOOTER_INCLUDE)
            or ('yes' = $WEBHELP_TRIAL_LICENSE)">
            <div class="footer" id="webhelp_copyright_information" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:choose>
                    <xsl:when
                        test="
                        (string-length($WEBHELP_FOOTER_FILE) = 0)
                        or ('yes' = $WEBHELP_TRIAL_LICENSE)">
                        <xsl:call-template name="getWebhelpString">
                            <xsl:with-param name="stringName" select="'Output generated by'"/>
                        </xsl:call-template>
                        <a class="oxyFooter" href="http://www.oxygenxml.com/xml_webhelp.html" target="_blank">
                            &lt;oXygen/> XML WebHelp
                        </a>
                        <xsl:if test="'yes' = $WEBHELP_TRIAL_LICENSE">
                            <xsl:text> - Trial Edition</xsl:text>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Include custom footer file. -->
                        <xsl:call-template name="includeCustomHTMLContent">
                                <xsl:with-param name="hrefURL" select="oxygen:makeURL($WEBHELP_FOOTER_FILE)"/>
                            </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>