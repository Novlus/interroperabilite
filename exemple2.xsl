<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="html" encoding="UTF-8" indent="yes"/>

   <!-- On démarre de la racine -->
   <xsl:template match="/"> 
     <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
     <xsl:apply-templates />  
   </xsl:template>

    <xsl:template match="*">
        Feuille :
         <xsl:value-of select="."/>  
     <xsl:text>    </xsl:text>
    </xsl:template>

     <xsl:template match="@*">
        Attribut :
         <xsl:value-of select="."/>  
     <xsl:text>    </xsl:text>
    </xsl:template>
   
   
   <!-- Régle à appliquer lorsque le parcours 
	arrive sur un élément nommé 'Scenario' -->
   <xsl:template match="Scenario">
     <!-- Cette fois on ne parcourt que le sous élement 'Prenom' -->
     <!-- à noter que si le parcours arrive sur une feuille, le contenu de la feuille est inscrit en sortie --> 
     <!-- <xsl:apply-templates select="Prenom" /> -->
     <xsl:value-of select="../Titre" />  
        
   </xsl:template>

   <xsl:template match="Scenario/Prenom">
     <!-- Cette fois on ne parcourt que le sous élement 'Prenom' -->
     <!-- à noter que si le parcours arrive sur une feuille, le contenu de la feuille est inscrit en sortie --> 
     Prénom : <!-- valeur écrite dans la sortie -->
     <xsl:value-of select="."/>  
     <xsl:text>    </xsl:text>
   </xsl:template>


    <xsl:template match="text()"/>        <!-- permet de faire appliquer le filtre vu precedement --> 

</xsl:stylesheet>
