export default {
    title: "Report 2025",
    description: "VU Student Representation's annual report for 2024-2025 term",
    themeConfig: {
        nav: [
        //     { text: 'Congratulations', link: '/en/sveikinimai' },
            { text: 'Structure', link: '/en/vu-sa/parlamentas' },
            { text: 'Goals', link: '/en/mvp/strateginiai' },
            { text: 'Strategic directions', items: [
                { text: 'High quality studies and its environment', link: '/en/kokybiskos-studijos/nacionalinis' },
                { text: 'Strong organization', link: '/en/stipri-organizacija/projektai' },
                { text: 'Sustainable University community', link: '/en/darni-bendruomene/darni-bendruomene' },
            ] },
            { text: 'Community', link: '/en/bendruomene' },
            // { text: 'Acknowledgments', link: '/en/padeka' },

        ],
        logo: {
            light: '/img/logos/vusa-en-b.png',
            dark: '/img/logos/vusa-en-w.png',
        },
        sidebar: [
            { text: 'Congratulations', link: '/en/sveikinimai' },
            {
                text: 'VU SR structure and principles of activity ⭐️',
                items: [
                    { text: 'Strategy', link: '/en/strategija' },
                    { text: 'Parliament', link: '/en/vu-sa/parlamentas' },
                    { text: 'Board', link: '/en/vu-sa/taryba' },
                    { text: 'Institutional Strengthening Fund', link: '/en/vu-sa/isf' },
                    { text: 'Revision Commision', link: '/en/vu-sa/revizijos-komisija' },
                    { text: 'Data Security Group', link: '/en/vu-sa/dag' },
                ]
            },
            {
                text: 'Year plan 📝',
                items: [
                    { text: 'VU SR goals', link: '/en/mvp/strateginiai' },
                    { text: 'Goals in VU SR units', link: '/en/mvp/tikslai-padaliniuose' },
                ]
            },
            {
                text: 'Implementation of strategic directions 🎯',
                items: [
                    {
                        text: 'High quality studies and their environment',
                        collapsed: true,
                        items: [
                            { text: 'Representation in the national space and city government', link: '/en/kokybiskos-studijos/nacionalinis' },
                            { text: 'Representation at VU', link: '/en/kokybiskos-studijos/vu' },
                            { text: 'Cooperation', link: '/en/kokybiskos-studijos/bendradarbiavimas' },
                            { text: 'International cooperation', link: '/en/kokybiskos-studijos/tarptautinis' },
                            { text: 'Papers', link: '/en/kokybiskos-studijos/rastai' },
                        ]
                    },
                    {
                        text: 'Strong organization',
                        collapsed: true,
                        items: [
                            { text: 'Projects', link: '/en/stipri-organizacija/projektai' },
                            { text: 'Research', link: '/en/stipri-organizacija/tyrimai' },
                            { text: 'VU SR process renewal', link: '/en/stipri-organizacija/procesu-atnaujinimas' },
                            { text: 'Institutional Strengthening Fund', link: '/en/stipri-organizacija/isf' },
                        ]
                    },
                    {
                        text: 'Sustainable university community',
                        collapsed: true,
                        items: [
                            { text: 'Community events', link: '/en/darni-bendruomene/renginiai' },
                            { text: 'Integration of students', link: '/en/darni-bendruomene/integracija' },
                            { text: 'Student initiatives', link: '/en/darni-bendruomene/iniciatyvos' },
                        ]
                    },
                ]
            },
            {
                text: 'We give our thanks 💪',
                items: [
                    { text: 'VU SR community', link: '/en/bendruomene' },
                    { text: 'Friends and the report project team', link: '/en/padeka' },
                ]
            }
        ],
    }
}
