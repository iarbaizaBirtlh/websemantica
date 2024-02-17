<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    <!--Template para la página principal de la tienda-->
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
            <main class="principal">
                <!--Aplicar la plantilla para cada artículo de la tienda-->
                <xsl:apply-templates select="//articulo"/>
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
    </xsl:template>
    <!--Template para cada artículo de la tienda-->
    <xsl:template match="articulo">
        <article>
            <section>
                <img class="articulo" src="../img/{@foto}"/>
            </section>
            <section>
                <h2><xsl:value-of select="precio"/> €</h2>
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <ul>
                    <!--Aplicar la plantilla para cada comentario-->
                    <xsl:apply-templates select="comentarios"/>
                </ul>
            </section>
        </article>
    </xsl:template>
    <!--Template para cada comentario-->
    <xsl:template match="comentarios">
        <li>
            <xsl:value-of select="@fecha"/>: <xsl:value-of select="."/>
        </li>
    </xsl:template>
</xsl:stylesheet>
