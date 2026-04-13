<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="ru">
      <head>
        <title>NESPESHNYE — RSS SIGNAL</title>
        <style>
          /* 1. ОСНОВНОЙ ФОН И СЕТКА */
          html, body {
            background-color: #1a1a1a;
            background-image:
                repeating-linear-gradient(0deg, rgba(0,0,0,0.25) 0px, rgba(0,0,0,0.25) 2px, transparent 2px, transparent 4px),
                repeating-linear-gradient(90deg, rgba(0,0,0,0.25) 0px, rgba(0,0,0,0.25) 2px, transparent 2px, transparent 4px),
                linear-gradient(135deg, #0d0d0d 0%, #1e140a 40%, #2b1d14 70%, #0d0d0d 100%);
            background-attachment: fixed;
            background-size: cover;
            color: #cd7f32;
            font-family: 'Courier New', Courier, monospace;
            margin: 0;
            padding: 0;
          }

          /* 2. ЭФФЕКТ СКАНЛАЙНА (ПОЛОСА) */
          .scanline {
            position: fixed;
            top: -100px; left: 0;
            width: 100%; height: 100px;
            background: linear-gradient(to bottom, transparent 0%, rgba(205, 127, 50, 0.05) 50%, transparent 100%);
            animation: scanline_move 10s linear infinite;
            pointer-events: none;
            z-index: 100;
          }
          @keyframes scanline_move {
            0% { top: -100px; }
            100% { top: 100vh; }
          }

          /* 3. КОНТЕЙНЕР ТЕРМИНАЛА */
          .terminal-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid rgba(205, 127, 50, 0.3);
            position: relative;
            background: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(2px);
          }

          .status-bar {
            border-bottom: 1px solid #cd7f32;
            padding-bottom: 10px;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: bold;
          }

          /* 4. ОКИСЛЕНИЕ ССЫЛОК */
          a {
            color: #cd7f32;
            text-decoration: none;
            transition: color 1.2s ease, text-shadow 0.8s ease;
            border-bottom: 1px dotted rgba(205, 127, 50, 0.5);
          }
          a:hover {
            color: #4fb3a5; /* Тот самый бирюзовый */
            text-shadow: 0 0 8px rgba(79, 179, 165, 0.6);
            border-bottom: 1px solid #4fb3a5;
          }

          .item {
            margin-bottom: 50px;
            padding-left: 15px;
            border-left: 1px solid rgba(205, 127, 50, 0.2);
          }

          .pub-date {
            font-size: 0.8em;
            opacity: 0.6;
            margin-bottom: 5px;
          }

          h1, h3 {
            margin-top: 0;
            text-transform: uppercase;
          }

          .description {
            line-height: 1.6;
            text-align: justify;
          }
        </style>
      </head>
      <body>
        <div class="scanline"></div>
        <div class="terminal-container">
          <div class="status-bar">[ NODE STATUS: BROADCASTING SIGNAL ]</div>
          <h1>Signal: NESPESHNYE</h1>
          <p>Автономный канал трансляции. Для подписки используйте URL этого терминала в вашем ридере.</p>
          <hr style="border: 0; border-top: 1px solid rgba(205, 127, 50, 0.3); margin: 30px 0;" />

          <xsl:for-each select="rss/channel/item">
            <div class="item">
              <div class="pub-date"><xsl:value-of select="pubDate"/></div>
              <h3><a href="{link}"><xsl:value-of select="title"/></a></h3>
              <div class="description">
                <xsl:value-of select="description" disable-output-escaping="yes"/>
              </div>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>