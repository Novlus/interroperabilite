<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />

    <!-- On démarre de la racine -->
    <xsl:template match="/">
        <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="*">
        <xsl:apply-templates select="@*" />
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="*/text()">
        Feuille :
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="@*">
        Attribut :
        <xsl:value-of select="." />
    </xsl:template>


    <xsl:template match="text()" /> <!-- permet de faire appliquer le filtre vu precedement -->

</xsl:stylesheet>