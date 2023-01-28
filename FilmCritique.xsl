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
                <style>

                </style>
            </head>
            <body>
                <xsl:apply-templates />
                <!-- On place ici tous
                les
                element
                qu'on
                utilise dans
                xsl:templates-->

            </body>
        </html>
    </xsl:template>

    <xsl:template match="Film"> <!-- on commence à partir de Film -->
        <h1>
            <xsl:value-of select="Titre" />
        </h1>

            <xsl:apply-templates select="Critique" />

        <!-- On recupere tout le contenu qui
        se trouve dans -->
        <!-- <p>
            <xsl:apply-templates select="Critique" />
        </p> -->

    </xsl:template>

    <xsl:template match="Film/Critique">
        <h2 style="color: blue;">
            <strong>
                <xsl:value-of select="Media" />
            </strong> ( <span
                style="font-weight: normal;">
                <xsl:value-of select="Auteur" />
            </span> ) </h2>
            <p>
            <xsl:value-of select="Texte" />
        </p>
    </xsl:template>


    <xsl:template match="text()" />

</xsl:stylesheet>