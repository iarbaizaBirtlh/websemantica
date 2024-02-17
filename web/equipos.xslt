<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--Variable para almacenar el nombre del entrenador-->
<xsl:variable name="entrenadorNombre" select="//entrenador/nombre"/>
<!--Template para la página de equipos-->
<xsl:template match="/">
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta charset="utf-8"/>
            <meta name="description" content="Página principal" />
            <title>titulo de la web</title>
        </head>
        <body>
            <header>
                <img src="../img/logotipo.png" alt="Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            <main>
                <!--Aplicar la plantilla para el equipo entrenado por Julio Velasco-->
                <xsl:apply-templates select="//equipo[normalize-space(entrenador/nombre) = $entrenadorNombre]"/>
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
    </xsl:template>
    <!--Template para un equipo-->
    <xsl:template match="equipo">
        <h1><a href="{entrenador/url}"><xsl:value-of select="entrenador/nombre"/></a></h1>
        <article class="equipos">
            <h4><xsl:value-of select="nombre"/></h4>
            <!--Aplicar la plantilla para cada jugador titular-->
            <xsl:apply-templates select="jugadores/jugador[@titular='si']"/>
        </article>
    </xsl:template>
    <!--Template para un jugador titular-->
    <xsl:template match="jugador[@titular='si']">
        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:template>
</xsl:stylesheet>
