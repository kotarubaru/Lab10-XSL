<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : timetable-stylesheet.xsl
    Created on : April 2, 2016, 3:31 PM
    Author     : micha_000
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
     <xsl:template match="/">
        <html>
            <head>
                <title>Lab 10</title>
            </head>
            <body>
                <h2>Lab 10 Reports</h2>
                <xsl:call-template name="report1"/>
                <!--<xsl:call-template name="report2"/>-->
            </body>
        </html>
    </xsl:template>

    <xsl:template name="report1">
        <h1>Lab 10 [day side][start time top]</h1>
        <table>
            <tr>
                <xsl:for-each select="/timetable/courses/course/booking">
                    <xsl:sort select="@start-time"/>    
                    <th><xsl:value-of select="@start-time"/></th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="/timetable/courses/course/booking">
                <tr>
                    <td><xsl:value-of select="@day=Mon"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="@day=Tue"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="@day=Wed"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="@day=Thu"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="@day=Fri"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>



<!--    <xsl:template name="arrival_flight">
        <tr>
            <td>
                <xsl:value-of select="@arrive"/>
            </td>
            <td>
                <xsl:value-of select="../../@city"/>
            </td>
            <td>
                <xsl:value-of select="@num"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template name="departures">
        <h1>Calgary Departures</h1>
        <table>
            <tr>
                <th>Leaving at</th>
                <th>Destination</th>
                <th>Flight #</th>
            </tr>
            <xsl:for-each select="/schedule/origin[@code='YYC']/destination/flight">
                <xsl:sort select="@leave"/>
                <xsl:call-template name="departing_flight"/>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template name="departing_flight">
        <tr>
            <td>
                <xsl:value-of select="@leave"/>
            </td>
            <td>
                <xsl:value-of select="../@city"/>
            </td>
            <td>
                <xsl:value-of select="@num"/>
            </td>
        </tr>
    </xsl:template>-->

</xsl:stylesheet>