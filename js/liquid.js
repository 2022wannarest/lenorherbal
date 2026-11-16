/**
 * LAIMEI INTERNATIONAL - LIQUID STYLE INTERACTIVE ENGINE
 * Fluid Canvas, Wave Simulation, Glass Tilt, Category Filter & Series Accordion
 * Light Aqua & Crystal Blue Edition (清新淺藍水感版)
 */

(function () {
  'use strict';

  // 1. Interactive Liquid Canvas
  function initLiquidCanvas() {
    const canvas = document.getElementById('liquid-canvas');
    if (!canvas) return;

    const ctx = canvas.getContext('2d');
    let width = (canvas.width = window.innerWidth);
    let height = (canvas.height = window.innerHeight);

    let mouse = {
      x: width / 2,
      y: height / 2,
      targetX: width / 2,
      targetY: height / 2,
      isHovered: false,
    };

    window.addEventListener('resize', () => {
      width = canvas.width = window.innerWidth;
      height = canvas.height = window.innerHeight;
    });

    window.addEventListener('mousemove', (e) => {
      mouse.targetX = e.clientX;
      mouse.targetY = e.clientY;
      mouse.isHovered = true;
    });

    // Liquid Blobs definition (Luminous Light Blue & Water tones)
    const blobs = [
      { x: width * 0.2, y: height * 0.3, radius: 280, color: 'rgba(186, 230, 253, 0.55)', vx: 0.5, vy: 0.35 },
      { x: width * 0.8, y: height * 0.4, radius: 320, color: 'rgba(147, 197, 253, 0.45)', vx: -0.45, vy: 0.45 },
      { x: width * 0.5, y: height * 0.8, radius: 290, color: 'rgba(125, 211, 252, 0.5)', vx: 0.35, vy: -0.5 },
      { x: width * 0.15, y: height * 0.75, radius: 240, color: 'rgba(224, 242, 254, 0.65)', vx: -0.35, vy: -0.3 },
    ];

    // Ripple array
    const ripples = [];
    window.addEventListener('click', (e) => {
      ripples.push({
        x: e.clientX,
        y: e.clientY,
        radius: 8,
        alpha: 0.6,
      });
    });

    let time = 0;

    function animate() {
      time += 0.015;
      ctx.clearRect(0, 0, width, height);

      // Smooth mouse interpolation
      mouse.x += (mouse.targetX - mouse.x) * 0.05;
      mouse.y += (mouse.targetY - mouse.y) * 0.05;

      // Draw floating liquid blobs
      blobs.forEach((b, idx) => {
        b.x += b.vx + Math.sin(time + idx) * 0.4;
        b.y += b.vy + Math.cos(time + idx * 1.5) * 0.4;

        if (b.x < -100) b.x = width + 100;
        if (b.x > width + 100) b.x = -100;
        if (b.y < -100) b.y = height + 100;
        if (b.y > height + 100) b.y = -100;

        // Subtle pull toward mouse
        if (mouse.isHovered) {
          const dx = mouse.x - b.x;
          const dy = mouse.y - b.y;
          const dist = Math.sqrt(dx * dx + dy * dy);
          if (dist < 400) {
            b.x += (dx / dist) * 0.5;
            b.y += (dy / dist) * 0.5;
          }
        }

        const grad = ctx.createRadialGradient(b.x, b.y, 0, b.x, b.y, b.radius);
        grad.addColorStop(0, b.color);
        grad.addColorStop(1, 'rgba(240, 247, 255, 0)');

        ctx.fillStyle = grad;
        ctx.beginPath();
        ctx.arc(b.x, b.y, b.radius, 0, Math.PI * 2);
        ctx.fill();
      });

      // Interactive mouse aura
      if (mouse.isHovered) {
        const mouseGrad = ctx.createRadialGradient(mouse.x, mouse.y, 0, mouse.x, mouse.y, 220);
        mouseGrad.addColorStop(0, 'rgba(56, 189, 248, 0.18)');
        mouseGrad.addColorStop(1, 'transparent');
        ctx.fillStyle = mouseGrad;
        ctx.beginPath();
        ctx.arc(mouse.x, mouse.y, 220, 0, Math.PI * 2);
        ctx.fill();
      }

      // Draw ripples
      for (let i = ripples.length - 1; i >= 0; i--) {
        const r = ripples[i];
        r.radius += 3.0;
        r.alpha -= 0.015;

        if (r.alpha <= 0) {
          ripples.splice(i, 1);
          continue;
        }

        ctx.strokeStyle = `rgba(2, 132, 199, ${r.alpha})`;
        ctx.lineWidth = 1.8;
        ctx.beginPath();
        ctx.arc(r.x, r.y, r.radius, 0, Math.PI * 2);
        ctx.stroke();
      }

      requestAnimationFrame(animate);
    }

    animate();
  }

  // 2. Liquid 3D Card Tilt (排除側邊導覽選單避免影響點擊體驗)
  function init3DCardTilt() {
    const cards = document.querySelectorAll('.liquid-glass:not(.side-series-nav), .product-card');

    cards.forEach((card) => {
      card.addEventListener('mousemove', (e) => {
        const rect = card.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        const centerX = rect.width / 2;
        const centerY = rect.height / 2;

        const rotateX = ((y - centerY) / centerY) * -4;
        const rotateY = ((x - centerX) / centerX) * 4;

        card.style.transform = `perspective(1000px) rotateX(${rotateX.toFixed(2)}deg) rotateY(${rotateY.toFixed(2)}deg) translateY(-4px)`;
      });

      card.addEventListener('mouseleave', () => {
        card.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) translateY(0px)';
      });
    });
  }

  // 3. Category Filter
  function initCategoryFilter() {
    const filterBtns = document.querySelectorAll('.tab-btn[data-category]');
    const productCards = document.querySelectorAll('.product-card[data-category]');

    if (!filterBtns.length || !productCards.length) return;

    filterBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        filterBtns.forEach((b) => b.classList.remove('active'));
        btn.classList.add('active');

        const selected = btn.getAttribute('data-category');

        productCards.forEach((card) => {
          const cardCat = card.getAttribute('data-category');
          if (selected === 'all' || cardCat === selected) {
            card.style.display = 'flex';
            setTimeout(() => {
              card.style.opacity = '1';
              card.style.transform = 'translateY(0)';
            }, 20);
          } else {
            card.style.opacity = '0';
            card.style.transform = 'translateY(15px)';
            setTimeout(() => {
              card.style.display = 'none';
            }, 250);
          }
        });
      });
    });
  }

  // 4. Side Series Accordion Nav & Active Product Auto-Highlight
  function initSeriesAccordion() {
    const seriesToggles = document.querySelectorAll('.series-toggle');
    if (!seriesToggles.length) return;

    // 根據目前網址檔名，自動展開所屬系列並標記 active-product 高亮
    const currentFile = decodeURIComponent(window.location.pathname.split('/').pop());
    if (currentFile) {
      let matchedLink = null;
      document.querySelectorAll('.series-product-link').forEach((link) => {
        if (link.getAttribute('href') === currentFile) {
          matchedLink = link;
        }
      });

      if (matchedLink) {
        document.querySelectorAll('.series-group').forEach((group) => {
          group.setAttribute('data-open', 'false');
          const toggle = group.querySelector('.series-toggle');
          const list = group.querySelector('.series-product-list');
          if (toggle) toggle.setAttribute('aria-expanded', 'false');
          if (list) list.style.display = 'none';
        });

        document.querySelectorAll('.series-product-link').forEach((link) => {
          link.classList.remove('active-product');
        });

        matchedLink.classList.add('active-product');
        const parentGroup = matchedLink.closest('.series-group');
        if (parentGroup) {
          parentGroup.setAttribute('data-open', 'true');
          const toggle = parentGroup.querySelector('.series-toggle');
          const list = parentGroup.querySelector('.series-product-list');
          if (toggle) toggle.setAttribute('aria-expanded', 'true');
          if (list) list.style.display = 'flex';
        }
      }
    }

    // 綁定點擊展開與收合事件
    seriesToggles.forEach((btn) => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        const currentGroup = btn.closest('.series-group');
        const currentList = currentGroup.querySelector('.series-product-list');
        const isCurrentlyOpen = currentGroup.getAttribute('data-open') === 'true';

        // 點擊時先收合其他系列
        document.querySelectorAll('.series-group').forEach((group) => {
          group.setAttribute('data-open', 'false');
          const toggle = group.querySelector('.series-toggle');
          const list = group.querySelector('.series-product-list');
          if (toggle) toggle.setAttribute('aria-expanded', 'false');
          if (list) list.style.display = 'none';
        });

        // 若原本為關閉狀態，則將該系列展開
        if (!isCurrentlyOpen) {
          currentGroup.setAttribute('data-open', 'true');
          btn.setAttribute('aria-expanded', 'true');
          if (currentList) currentList.style.display = 'flex';
        }
      });
    });
  }

  // Initialize on DOM ready
  document.addEventListener('DOMContentLoaded', () => {
    initLiquidCanvas();
    init3DCardTilt();
    initCategoryFilter();
    initSeriesAccordion();
  });
})();