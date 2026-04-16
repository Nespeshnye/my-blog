---
title: "AUTHENTICATION TERMINAL"
url: "/verify"
build:
  list: never
---

<div id="terminal-container" style="font-family: 'Courier New', monospace; font-size: 0.9rem; color: #b87333; opacity: 0.9; margin: 20px 0; line-height: 1.5; min-height: 100px;">
    <div id="terminal-content"></div><span id="terminal-cursor" style="display: inline-block; width: 10px; height: 1.2rem; background: #b87333; vertical-align: middle; margin-left: 5px;"></span>
</div>

<style>
  /* Анимация мерцания курсора */
  #terminal-cursor {
      animation: blink 0.8s infinite;
  }
  @keyframes blink {
      0%, 49% { opacity: 1; }
      50%, 100% { opacity: 0; }
  }
</style>

<script>
  (function() {
      const content = document.getElementById('terminal-content');
      const cursor = document.getElementById('terminal-cursor');
      
      const r = Math.random().toString(16).substr(2, 4).toUpperCase();
      const ts = new Date().toISOString().replace('T', ' ').substring(0, 19) + " UTC";

      const lines = [
          "INITIALIZING NODE 7V0...",
          "ESTABLISHING SECURE TUNNEL",
          "CONNECTION ESTABLISHED",
          "SESSION ID: 0x7V0-" + r + "-2026",
          "SIGNAL TIMESTAMP: " + ts
      ];

      let lineIndex = 0;
      let charIndex = 0;

      function typeChar() {
          if (lineIndex < lines.length) {
              const currentLineText = lines[lineIndex];
              
              if (charIndex === 0) {
                  const newLine = document.createElement('div');
                  content.appendChild(newLine);
              }

              if (charIndex < currentLineText.length) {
                  content.lastChild.textContent += currentLineText[charIndex];
                  charIndex++;
                  // Скорость печати букв (30-50мс - идеально для терминала)
                  setTimeout(typeChar, 40); 
              } else {
                  // Пауза между строками
                  lineIndex++;
                  charIndex = 0;
                  setTimeout(typeChar, 400); 
              }
          } else {
              // Текст окончен, курсор просто мигает в конце
          }
      }

      window.onload = function() {
          setTimeout(typeChar, 500); // Небольшая задержка перед стартом
      };
  })();
</script>

# [ SYSTEM STATUS: VERIFIED ]

Объект успешно идентифицирован в реестре **NESPESHNYE**.

### Категория артефакта:

* **Physical Assets (Coffee & Tea):** Лоты спешелти-кофе (авторская микро-обжарка) и селекционный китайский чай (контроль хранения и выдержки).
* **Collaborative Craft:** Лимитированные серии предметов (керамика, текстиль), созданные в соавторстве с мастерами под знаком NESPESHNYE.
* **Digital Units:** NFT-артефакты и программные манифесты, зафиксированные в блокчейне.

### Суть:
Этот объект (физический или цифровой) является подлинным носителем философии «Slow Living». Его происхождение подтверждено приватным ключом Узла 7v0. Любая копия, не имеющая ссылки на этот терминал, считается цифровым шумом.

***

*« Истина не в тираже, а в подлинности источника »*