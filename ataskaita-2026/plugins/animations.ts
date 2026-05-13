import { App } from 'vue';
import '../styles/animations.css';

// Client-side only GSAP initialization
export default {
  install: (app: App) => {
    // Only run in browser environment (not during SSR)
    if (typeof window !== 'undefined') {
      // Dynamic import of scrollReveal to avoid SSR issues
      import('../components/directives/scrollReveal').then(module => {
        const scrollReveal = module.default;
        // Register global directives
        app.directive('scroll-reveal', scrollReveal);
      });
    }
    
    // Additional global enhancements could be added here
  }
};
