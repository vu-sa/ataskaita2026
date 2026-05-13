import type { Directive, DirectiveBinding } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

// Only register GSAP plugins in browser environment
if (typeof window !== 'undefined') {
  // Register GSAP plugins
  gsap.registerPlugin(ScrollTrigger);
}

interface ScrollRevealOptions {
  delay?: number;
  distance?: string;
  duration?: number;
  easing?: string;
  interval?: number;
  opacity?: number;
  origin?: 'top' | 'right' | 'bottom' | 'left';
  rotate?: { x?: number; y?: number; z?: number };
  scale?: number;
  cleanup?: boolean;
  desktop?: boolean;
  mobile?: boolean;
  reset?: boolean;
  useDelay?: 'always' | 'onload' | 'once';
  viewFactor?: number;
  viewOffset?: {
    top?: number;
    right?: number;
    bottom?: number;
    left?: number;
  };
}

// Default options
const defaultOptions: ScrollRevealOptions = {
  delay: 0,
  distance: '50px',
  duration: 0.8,
  easing: 'power2.out',
  opacity: 0,
  origin: 'bottom',
  scale: 1,
  cleanup: false,
  desktop: true,
  mobile: true,
  reset: false,
  useDelay: 'once',
  viewFactor: 0.2,
  viewOffset: {
    top: 0,
    right: 0,
    bottom: 0,
    left: 0
  }
};

const scrollReveal: Directive = {
  mounted(el: HTMLElement, binding: DirectiveBinding) {
    const options = { ...defaultOptions, ...(binding.value || {}) };
    
    // Get transform values based on options
    let transformFrom = {};
    
    if (options.origin === 'top') {
      transformFrom = { y: `-${options.distance}` };
    } else if (options.origin === 'right') {
      transformFrom = { x: options.distance };
    } else if (options.origin === 'bottom') {
      transformFrom = { y: options.distance };
    } else if (options.origin === 'left') {
      transformFrom = { x: `-${options.distance}` };
    }
    
    if (options.scale !== 1) {
      transformFrom = { ...transformFrom, scale: options.scale };
    }
    
    if (options.rotate) {
      transformFrom = { 
        ...transformFrom,
        rotation: options.rotate.z || 0,
        rotationX: options.rotate.x || 0,
        rotationY: options.rotate.y || 0
      };
    }

    // Apply initial state
    gsap.set(el, {
      opacity: options.opacity,
      ...transformFrom
    });

    // Create animation
    const animate = () => {
      gsap.to(el, {
        opacity: 1,
        x: 0,
        y: 0,
        scale: 1,
        rotation: 0,
        rotationX: 0,
        rotationY: 0,
        duration: options.duration,
        delay: options.delay,
        ease: options.easing,
        scrollTrigger: {
          trigger: el,
          start: `top bottom-=${options.viewFactor * 100}%`,
          toggleActions: options.reset ? 'play reverse play reverse' : 'play none none none'
        }
      });
    };

    // Create sequence animation for children if interval is set
    if (binding.arg === 'sequence' && options.interval) {
      Array.from(el.children).forEach((child, index) => {
        gsap.set(child, {
          opacity: options.opacity,
          ...transformFrom
        });

        gsap.to(child, {
          opacity: 1,
          x: 0,
          y: 0,
          scale: 1,
          rotation: 0,
          rotationX: 0,
          rotationY: 0,
          duration: options.duration,
          delay: options.delay + (options.interval * index),
          ease: options.easing,
          scrollTrigger: {
            trigger: el,
            start: `top bottom-=${options.viewFactor * 100}%`,
            toggleActions: options.reset ? 'play reverse play reverse' : 'play none none none'
          }
        });
      });
    } else {
      animate();
    }
  }
};

export default scrollReveal;
