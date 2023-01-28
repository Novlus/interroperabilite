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
                <table>
                    <thead>
                        <tr>
                            <th>Titre</th>
                            <th>Réalisateur</th>
                            <th>Genre</th>
                            <th>Pays</th>
                            <th>Durée</th>
                            <th>Affiche</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Film">
        <tr>
            <xsl:apply-templates />
        </tr>
    </xsl:template>

    <xsl:template match="Film/Titre">
        <td>
            <strong>
                <xsl:value-of select="." />
            </strong>
        </td>
    </xsl:template>

    <xsl:template match="Film/Realisateur">
        <td>
            <xsl:apply-templates />

        </td>

    </xsl:template>

    <xsl:template match="Realisateur">


        <p>
            <strong>
                <xsl:value-of select="Nom" />
            </strong> &#160; <xsl:value-of
                select="Prenom" />
            <br />
        </p>


    </xsl:template>


    <xsl:template match="Film/Pays">
        <td>
            <xsl:value-of select="." />
        </td>
    </xsl:template>

    <xsl:template match="Film/Genre">
        <td>
            <xsl:value-of select="." />
        </td>
    </xsl:template>

    <xsl:template match="Film/Duree">
        <td>
            <xsl:value-of select="." />
        </td>
    </xsl:template>

    <!-- <xsl:template match="Film" name="Affiche">
        <td>
            <xsl:value-of
    select="@Affiche" />
        </td>
    </xsl:template> -->

    <xsl:template match="text()" />

</xsl:stylesheet>