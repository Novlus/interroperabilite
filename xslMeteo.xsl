<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <!-- <xsl:strip-space elements="*"/> -->

    <!-- On démarre de la racine -->
    <xsl:template match="/">
        <h1>Météo</h1>
        <h2>Température</h2>
            <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="echeance">
        <xsl:if test="contains(@timestamp,'2022-12-04')">
            <hr /><p>
                <strong>Date :</strong>
                <xsl:value-of select="@timestamp"></xsl:value-of>
            </p>
            <p>
                <xsl:apply-templates select="temperature/level" />
            </p>
            <h2> Pluie</h2>
            <p>
                <xsl:apply-templates select="pluie" />
            </p>
            <h2>Pluie convective</h2>
            <p>
                <xsl:apply-templates select="pluie_convective" />
            </p>
            <h2>Vent moyen</h2>
            <p>
                <xsl:apply-templates select="vent_moyen" />
            </p>
            <h2>Neige</h2>
            <p>
                <xsl:apply-templates select="risque_neige" />
            </p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="temperature/level">
        <xsl:if test="contains(@val,'sol')">
            <xsl:value-of select="." />
        </xsl:if>

    </xsl:template>

    <xsl:template match="pluie">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="pluie_convective">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="vent_moyen">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="risque_neige">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match=" text()" />

</xsl:stylesheet>