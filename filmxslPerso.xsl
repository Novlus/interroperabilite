<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:myNS="http://devedge.netscape.com/2002/de">

    <xsl:output method="html" />

    <xsl:template match="/">
        <html>
            <head>
                <title> Titres </title>
            </head>
            <body>
                <h1>Liste des films de ma base</h1>
                <ul>
                    <xsl:apply-templates />
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Film/Titre">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>
    <xsl:template match="text()" />
</xsl:stylesheet>