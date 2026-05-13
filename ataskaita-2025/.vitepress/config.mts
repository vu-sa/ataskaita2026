import { defineConfig } from 'vitepress'
import { sharedConfig } from './config/shared'

import ltConfig from './config/lt'
import enConfig from './config/en'
import tailwindcss from '@tailwindcss/vite'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import dsv from '@rollup/plugin-dsv';

// https://vitepress.dev/reference/site-config
export default defineConfig({
  srcDir: './src',
  sitemap: {
    hostname: 'https://ataskaita2025.vusa.lt',
  },
  head: [
    // Font preloads
    [
      'link',
      { rel: 'preconnect', href: 'https://fonts.googleapis.com' }
    ],
    [
      'link',
      { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }
    ],
    [
      'link',
      { href: 'https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap', rel: 'stylesheet' }
    ],
    // Meta tags
    ['meta', { name: 'author', content: 'VU SA - Vilniaus universiteto Studentų atstovybė' }],
    ['meta', { name: 'keywords', content: 'VU SA, studentų atstovybė, Vilniaus universitetas, metinė ataskaita, studentų atstovavimas' }],
    // Favicon
    ['link', { rel: 'icon', href: '/img/logos/vusa-lt-b.png', type: 'image/png' }],
    // Open Graph / Facebook
    ['meta', { property: 'og:type', content: 'website' }],
    ['meta', { property: 'og:url', content: 'https://ataskaita2025.vusa.lt' }],
    ['meta', { property: 'og:image', content: '/img/meta.png' }],
    ['meta', { property: 'og:image:alt', content: 'VU SA metinė ataskaita 2025' }],
    ['meta', { property: 'og:site_name', content: 'VU SA metinė ataskaita 2024-2025' }],
    // Twitter
    ['meta', { name: 'twitter:card', content: 'summary_large_image' }],
    ['meta', { name: 'twitter:image', content: '/img/meta.png' }],
    ['meta', { name: 'twitter:image:alt', content: 'VU SA metinė ataskaita 2025' }],
    // Canonical URL
    ['link', { rel: 'canonical', href: 'https://ataskaita.vusa.lt' }]
  ],
  markdown: {
    // config: (md) => {}
    image: {
      lazyLoading: true
    }
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    ...sharedConfig
  },
  locales: {
    root: {
      label: 'Lietuvių',
      lang: 'lt',
      ...ltConfig

    },
    en: {
      label: 'English',
      lang: 'en',
      link: '/en/',
      ...enConfig
    }
  },
  vite: {
    plugins: [
      tailwindcss({}),
      dsv()
    ],
    resolve: {
      alias: {
        '@': fileURLToPath(new URL('../components', import.meta.url)),
      },
    }
  },
})
