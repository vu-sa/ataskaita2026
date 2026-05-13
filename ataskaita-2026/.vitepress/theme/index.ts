// https://vitepress.dev/guide/custom-theme
import { h } from 'vue'
import DefaultTheme from 'vitepress/theme-without-fonts'
import Layout from './Layout.vue'
import './style.css'
import './my-fonts.css'
import './print.css'
import '../../styles/animations.css'

// Import global components
// import ScrollProgress from '../../components/ScrollProgress.vue'

// Import plugins 
import animationsPlugin from '../../plugins/animations'

export default {
  ...DefaultTheme,
  Layout: () => {
    return h(Layout, null, {
      // Add global components to layout
      // 'layout-top': () => h(ScrollProgress),
      // Other slots could be added here
    })
  },
  enhanceApp({ app, router, siteData }) {
    // Register global plugins
    app.use(animationsPlugin)
    
    // Add global properties or methods here if needed
    app.config.globalProperties.$formatDate = (date: string | Date) => {
      return new Date(date).toLocaleDateString('lt-LT', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      })
    }
  }
}
