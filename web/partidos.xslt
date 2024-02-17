<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--Template para la página de partidos-->
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
                <h1>PARTIDOS</h1>
                <table>
                    <tr>
                        <th>PARTIDO</th>
                        <th>FECHA</th>
                        <th>RESULTADO</th>
                    </tr>
                    <!--Aplicar la plantilla para cada partido en Lima, ordenados por fecha-->
                    <xsl:apply-templates select="//partido[lugar/@ciudad='Lima']">
                        <xsl:sort select="fecha" order="descending"/>
                    </xsl:apply-templates>
                </table>
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
    </xsl:template>
    <!--Template para un partido-->
    <xsl:template match="partido">
        <tr>
            <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
            <td><xsl:value-of select="fecha"/></td>
            <td>
                <!--Si gana el visitante, aplicar la clase 'azul'-->
                <xsl:choose>
                    <xsl:when test="equipos/visitante/@puntuacion > equipos/local/@puntuacion">
                        <span class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
