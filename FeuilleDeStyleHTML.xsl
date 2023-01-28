<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <!-- <xsl:strip-space elements="*"/> -->

    <!-- On démarre de la racine -->
    <xsl:template match="/">
        <html>
            <head>
                <title> Titres </title>
            </head>
            <body>
                <h1>Liste des titres de Film</h1>
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