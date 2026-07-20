const toggle = document.querySelector('[data-menu-toggle]');
const menu = document.querySelector('[data-menu]');
const overlay = document.querySelector('[data-menu-overlay]');

const setMenu = (open) => {
  menu.classList.toggle('is-open', open);
  overlay.classList.toggle('is-open', open);
  toggle.classList.toggle('is-open', open);
  document.body.classList.toggle('menu-open', open);
  toggle.setAttribute('aria-expanded', String(open));
  toggle.setAttribute('aria-label', open ? 'Закрыть меню' : 'Открыть меню');
};

toggle.addEventListener('click', () => setMenu(!menu.classList.contains('is-open')));
overlay.addEventListener('click', () => setMenu(false));
menu.querySelectorAll('a').forEach((link) => link.addEventListener('click', () => setMenu(false)));

document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape') setMenu(false);
});

document.querySelectorAll('a[href^="#"]').forEach((link) => {
  link.addEventListener('click', (event) => {
    const target = document.querySelector(link.getAttribute('href'));
    if (!target) return;
    event.preventDefault();
    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
});

document.querySelectorAll('.faq-question').forEach((button) => {
  button.addEventListener('click', () => {
    const item = button.closest('.faq-item');
    const answer = item.querySelector('.faq-answer');
    const isOpen = item.classList.toggle('is-open');
    answer.style.maxHeight = isOpen ? `${answer.scrollHeight}px` : 0;
  });
});

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (!entry.isIntersecting) return;
    entry.target.classList.add('is-visible');
    observer.unobserve(entry.target);
  });
}, { threshold: 0.14 });

document.querySelectorAll('.reveal').forEach((element) => observer.observe(element));

const form = document.querySelector('[data-form]');
const message = document.querySelector('[data-form-message]');

form.addEventListener('submit', (event) => {
  event.preventDefault();
  let isValid = true;

  form.querySelectorAll('[required]').forEach((field) => {
    const fieldValid = field.name === 'phone'
      ? /^\+?[0-9\s()\-]{10,}$/.test(field.value.trim())
      : field.checkValidity();

    field.classList.toggle('error', !fieldValid);
    isValid = isValid && fieldValid;
  });

  message.textContent = isValid
    ? 'Спасибо! Мы свяжемся с вами в ближайшее время.'
    : 'Проверьте имя и телефон.';
  message.style.color = isValid ? '#078675' : '#f04438';

  if (isValid) form.reset();
});
