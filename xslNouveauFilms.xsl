<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <!-- <xsl:strip-space elements="*"/> -->

    <!-- On démarre de la racine -->
    <xsl:template match="/">
        <BASES>
            <Realisateurs>
                <xsl:apply-templates select="//Realisateur"></xsl:apply-templates>
            </Realisateurs>
            <Acteurs>
                <xsl:apply-templates select="///Acteur"></xsl:apply-templates>
            </Acteurs>
            <FILMS>
                <xsl:apply-templates></xsl:apply-templates> <!-- beas besoin de préciser car premier
                enfant -->
            </FILMS>
        </BASES>
    </xsl:template>

    <xsl:template match="Realisateur">

        <xsl:if test="not(@ID= ../preceding-sibling::*/Realisateur/@ID)">
            <xsl:copy-of select="." />
        </xsl:if>

    </xsl:template>

    <xsl:template match="Acteur">
        <xsl:if test="not(@ID= ../preceding-sibling::*/Acteur/@ID)">
            <xsl:copy-of select="." />
        </xsl:if>
    </xsl:template>

    <!-- <xsl:template match="Film">
        <xsl:copy><xsl:apply-templates select="@ID |
    Realisateur" />
        </xsl:copy>
    </xsl:template> -->

    <xsl:template match="Film">
        <xsl:copy>
            <xsl:attribute name="ID">
                <xsl:value-of select="@ID"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute
                name="Langue">
                <xsl:value-of select="@Langue"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute
                name="Affiche">
                <xsl:value-of select="@Affiche"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute
                name="Realisateur">
                <xsl:apply-templates select="Realisateur" mode="realisateur"></xsl:apply-templates>
                <!-- <xsl:value-of select="@Affiche"></xsl:value-of> -->
            </xsl:attribute>
            <xsl:attribute
                name="Acteur">
                <xsl:apply-templates select="Acteurs/Acteur" mode="acteur"></xsl:apply-templates>
                <!-- <xsl:value-of select="@Affiche"></xsl:value-of> -->
            </xsl:attribute>
            <xsl:copy-of
                select="Titre" />
                <xsl:copy-of
                select="Scenario" />
                <xsl:copy-of
                select="Genre" />
                <xsl:copy-of
                select="Pays" />
                <xsl:copy-of
                select="Duree" />
                <xsl:copy-of
                select="Resume" />
                <xsl:copy-of
                select="Acteurs" />
                <xsl:copy-of
                select="Palmares" />
                <xsl:copy-of
                select="Image" />
                <xsl:copy-of
                select="Montage" />
                <xsl:copy-of
                select="Musique" />
                <xsl:copy-of
                select="Producteur" />


        </xsl:copy>


    </xsl:template>

    <xsl:template match="Realisateur" mode="realisateur">
        <xsl:value-of select="@ID"></xsl:value-of> <xsl:if test="position() !=last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:template>

    <xsl:template match="Acteurs/Acteur" mode="acteur">
        <xsl:value-of select="@ID"></xsl:value-of> <xsl:if test="position() !=last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:template>


    <!-- <xsl:template match="text()" /> -->

</xsl:stylesheet>