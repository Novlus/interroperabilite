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
                <h1>Liste des titres de Film</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>N°</th>
                            <th>Titre</th>
                            <th>Réalisateur</th>
                            <th>Genre</th>
                            <th>Pays</th>
                            <th>Durée</th>
                            <th>Affiche</th>
                            <th>Critique (<span style="color:red;">Ils ont aimés</span>)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates /> <!-- On place ici tous les element qu'on utilise dans
                        xsl:templates-->
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Film"> <!-- on commence à partir de Film -->
        <tr>
            <td>
                <xsl:value-of select="substring(@ID,2)" />

            </td>
            <td>
                <xsl:value-of select="Titre" /> <!-- On recupere tout le contenu qui se trouve dans
                les balise Titre contenu dans les balises Film-->
            </td>
            <td>

                <!-- <p> Nombre de réalisateurs = <xsl:value-of
                        select="count(Realisateur)"
                /></p> -->
                <xsl:choose>
                    <xsl:when test="count(Realisateur)=1 or count (Realisateur)=2">
                        <xsl:apply-templates select="Realisateur" />
                    </xsl:when>
                    <xsl:otherwise>
                        <p>
                            <em>Film collectifs</em>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- permet d'appliquer le contenu de la prochaine template -->
            </td>
            <td>
                <xsl:value-of select="Genre" />
            </td>
            <td>
                <xsl:value-of select="Pays" />
            </td>
            <td>
                <xsl:value-of select="Duree" />
            </td>
            <td>
                <img width="100px">
                    <xsl:attribute name="src"> <!-- On recupere l'attribut Affiche le src correspond
                        aux src de image ce qui permet de recuperer la valeur de l'attribut affiche
                        et de le mettre dans le src de l'image -->
                        <xsl:value-of select="@Affiche" />
                    </xsl:attribute>
                </img>
            </td>
            <td>
                <!-- <p> Note supérieur à 2 = <xsl:value-of
                        select="count(Critique/Note)"
                /></p> -->
                <xsl:if test="(Critique/Note)>2">
                    <!-- <p>
                        <strong>
                            <xsl:value-of
                    select="Critique/Media" />
                        </strong>
                    </p> -->
                   <xsl:apply-templates select="Critique" />
                   <a href=""></a>

                </xsl:if>
            </td>
        </tr>
    </xsl:template>


    <xsl:template match="Realisateur">
        <p>
            <strong>
                <xsl:value-of select="Nom" />
            </strong> &#160; <xsl:value-of
                select="Prenom" />
        </p>

    </xsl:template>

    <xsl:template match="Critique">
        <p>
            <xsl:if test="Note > 2">
                <strong>
                    <xsl:value-of
                        select="Media" />
                </strong>
            </xsl:if>
        </p>
    </xsl:template>

    <xsl:template match="text()" />

</xsl:stylesheet>